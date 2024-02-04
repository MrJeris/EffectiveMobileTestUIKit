//
//  HotelRoomsViewController.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 03.02.2024.
//

import UIKit
import SwiftUI

class HotelRoomsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var hotels: [Room] = [
        Room.init(id: 1, name: "Стандартный с видом на бассейн или сад", price: 186600, pricePer: "за 7 ночей с перелётом", peculiarities: ["111"], imageUrls: ["111"]),
        Room.init(id: 2, name: "Стандартный с видом на бассейн или сад", price: 186600, pricePer: "за 7 ночей с перелётом", peculiarities: ["111"], imageUrls: ["111"]),
    ]
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Steigenber Makadi"
        
        view.addSubview(tableView)
        setupConstraints()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HotelRoomCell.self, forCellReuseIdentifier: "cell")
        
        tableView.backgroundColor = .grayBackgroundColor
        tableView.separatorColor = .clear
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .white
    }
    
    private func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HotelRoomCell
        
        let room = hotels[indexPath.row]
        cell.hotelName.text = room.name
        cell.priceLabel.text = "\(room.price) Р"
        cell.priceForItLabel.text = room.pricePer
        
        return cell
    }
}

struct HotelRooms: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        HotelRoomsViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}

#Preview {
    HotelRooms()
}
