//
//  InfoHotelListView.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 01.02.2024.
//

import UIKit

class InfoHotelListView: UITableView, UITableViewDelegate, UITableViewDataSource {
    let images: [UIImage] = [UIImage(resource: .emojiHappy),
                             UIImage(resource: .tick),
                             UIImage(resource: .close)]
    
    let titleLabels: [String] = ["Удобства", "Что включено", "Что не включено"]
    let infoLabel: [String] = ["Самое необходимое", "Самое необходимое", "Самое необходимое"]
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        delegate = self
        dataSource = self
        
        isScrollEnabled = false
        
        register(InfoButtonCell.self, forCellReuseIdentifier: "Cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! InfoButtonCell
        
        cell.image.image = images[indexPath.row]
        cell.titleLabel.text = titleLabels[indexPath.row]
        cell.aboutHotelLabel.text = infoLabel[indexPath.row]
        cell.backgroundColor = .grayBackgroundColor
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

#Preview {
    let view = InfoHotelListView()
    view.backgroundColor = .orange
    return view
}
