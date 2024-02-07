//
//  ViewController.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 01.02.2024.
//

import UIKit
import SwiftUI

class HotelViewController: UIViewController {
    
    var coordinator: HotelCoordinator?
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    let mainInfoSection = MainInfoHotelView()
    let detailInfoSection = DetailInfoHotelView()
    
    let divider: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .lightGray.withAlphaComponent(0.5)
        return uiView
    }()
    
    let blueNextButton = BlueNextButtonView(title: "К выбору номера")
    
    let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .grayBackgroundColor
        return containerView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        customElement()
        setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        mainInfoSection.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 12)
        detailInfoSection.layer.cornerRadius = 12
    }
    
    private func customElement() {
        view.backgroundColor = .grayBackgroundColor
        scrollView.frame = view.bounds
        title = "Отель"
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .white
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        view.addSubview(divider)
        view.addSubview(blueNextButton)
        [mainInfoSection, detailInfoSection].forEach { containerView.addSubview($0) }
    }
    
    private func setupConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        mainInfoSection.translatesAutoresizingMaskIntoConstraints = false
        detailInfoSection.translatesAutoresizingMaskIntoConstraints = false
        divider.translatesAutoresizingMaskIntoConstraints = false
        blueNextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: divider.topAnchor),
            
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            mainInfoSection.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            mainInfoSection.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            mainInfoSection.topAnchor.constraint(equalTo: containerView.topAnchor),
            
            detailInfoSection.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            detailInfoSection.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            detailInfoSection.topAnchor.constraint(equalTo: mainInfoSection.bottomAnchor, constant: 8),
            detailInfoSection.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            
            divider.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            divider.heightAnchor.constraint(equalToConstant: 1),
            
            blueNextButton.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 12),
            blueNextButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            blueNextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            blueNextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
}

private struct HotelView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let view = HotelViewController()
        view.detailInfoSection.tagListView.configure(for: ["3-я линия", "Платный Wi-Fi в фойе", "30 км до аэропорта", "1 км до пляжа"])
        return view
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}

#Preview {
    HotelView()
}
