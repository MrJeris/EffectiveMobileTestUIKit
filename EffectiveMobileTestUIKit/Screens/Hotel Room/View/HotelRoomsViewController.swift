//
//  HotelRoomsViewController.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 03.02.2024.
//

import Combine
import UIKit
import SwiftUI

//class HotelRoomsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//    
//    var hotels: [Room] = [
//        Room.init(id: 1, name: "Стандартный с видом на бассейн или сад", price: 186600, pricePer: "за 7 ночей с перелётом", peculiarities: ["111"], imageUrls: ["111"]),
//        Room.init(id: 2, name: "Стандартный с видом на бассейн или сад", price: 186600, pricePer: "за 7 ночей с перелётом", peculiarities: ["111"], imageUrls: ["111"]),
//    ]
//    private let tableView = UITableView()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        title = "Steigenber Makadi"
//        
//        view.addSubview(tableView)
//        setupConstraints()
//        
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.register(HotelRoomCell.self, forCellReuseIdentifier: "cell")
//        
//        tableView.backgroundColor = .grayBackgroundColor
//        tableView.separatorColor = .clear
//        
//        navigationController?.navigationBar.backgroundColor = .white
//        navigationController?.navigationBar.barTintColor = .white
//    }
//    
//    private func setupConstraints() {
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.topAnchor.constraint(equalTo: view.topAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//        ])
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return hotels.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HotelRoomCell
//        
//        let room = hotels[indexPath.row]
//        cell.hotelName.text = room.name
//        cell.priceLabel.text = "\(room.price) Р"
//        cell.priceForItLabel.text = room.pricePer
//        
//        return cell
//    }
//}

class HotelRoomsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    // MARK: - Properties
    
    var viewModel: HotelRoomViewModel?
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - UI Elements
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.sectionInset = .init(top: 8, left: 0, bottom: 8, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HotelRoomCell.self, forCellWithReuseIdentifier: "cell")
        
        collectionView.backgroundColor = .grayBackgroundColor
        view.addSubview(collectionView)
        setupConstraint()
        
        title = "Steigenber Makadi"
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .white
        
        bindViewModel()
    }
    
    // MARK: - ViewModel Binding
    
    private func bindViewModel() {
        viewModel?.$rooms
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.collectionView.reloadData()
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Constraints
    
    private func setupConstraint() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.rooms.rooms.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HotelRoomCell
        
        guard let room = viewModel?.rooms.rooms[indexPath.row] else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: room)
        
        cell.blueNextButton.action = {
            self.viewModel?.coordinator?.showHotelBooking()
        }
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.frame.width
        let cellHeight: CGFloat = 550
        return CGSize(width: cellWidth, height: cellHeight)
    }
}

struct HotelRooms: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let vc = HotelRoomsViewController()
        vc.viewModel = HotelRoomViewModel()
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}

#Preview {
    HotelRooms()
}
