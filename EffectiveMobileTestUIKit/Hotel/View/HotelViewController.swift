//
//  ViewController.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 01.02.2024.
//

import UIKit
import SwiftUI

class HotelViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    let mainInfoSection = MainInfoHotelView()
    let detailInfoSection = DetailInfoHotelView()
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
        view.addSubview(blueNextButton)
        [mainInfoSection, detailInfoSection].forEach { containerView.addSubview($0) }
    }
    
    private func setupConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        mainInfoSection.translatesAutoresizingMaskIntoConstraints = false
        detailInfoSection.translatesAutoresizingMaskIntoConstraints = false
        blueNextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: blueNextButton.topAnchor),
            
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
            
            blueNextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            blueNextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blueNextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

struct HotelView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        HotelViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}

#Preview {
    HotelView()
}
