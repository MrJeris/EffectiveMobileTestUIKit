//
//  ImageCarouselViewController.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 01.02.2024.
//

import UIKit

class ImageCarouselView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var images: [UIImage] = []
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        super.init(frame: frame, collectionViewLayout: layout)
        showsHorizontalScrollIndicator = false
        isPagingEnabled = true
        
        dataSource = self
        delegate = self
        register(ImageCell.self, forCellWithReuseIdentifier: "ImageCell")
    }
    
    func setup(images: [UIImage]) {
        self.images = images
        reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        cell.imageView.image = images[indexPath.item]
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        return cell
    }
}


#Preview {
    let view = ImageCarouselView()
    view.backgroundColor = .blue
    return view
}
