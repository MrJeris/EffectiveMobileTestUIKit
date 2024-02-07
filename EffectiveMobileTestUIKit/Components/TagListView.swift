//
//  TagListView.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 06.02.2024.
//

import UIKit

class TagListView: UIView {
    private var tagViews: [TagView] = []
    private let tagHeight: CGFloat = 28
    private let tagSpacingX: CGFloat = 8
    private let tagSpacingY: CGFloat = 8
    
    private var tagListViewHeightConstraint: NSLayoutConstraint!
    
    func configure(for tags: [String]) {
        tagViews.forEach { $0.removeFromSuperview() }
        tagViews.removeAll()
        
        //for tagText in tags {
        for (index, tagText) in tags.enumerated() {
//            if index == tags.count - 1 {
//                let tagView = TagView(tagText: tagText, isButton: true)
//            } else {
//                let tagView = TagView(tagText: tagText)
//            }
            
            let tagView = index != tags.count - 1 ? TagView(tagText: tagText) : TagView(tagText: tagText, isButton: true)
            
            tagViews.append(tagView)
            addSubview(tagView)
            tagView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        setNeedsLayout()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layoutTags()
    }

    private func layoutTags() {
        var currentOriginX: CGFloat = 0
        var currentOriginY: CGFloat = 0
        
        tagViews.forEach { tagView in
            // Расчет размеров тега на основе его текста
            var tagSize = tagView.tagView.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: tagHeight))
            tagSize.width += tagView.arrowRight.frame.width

            let tagWidth = min(tagSize.width + 20, bounds.width) // Добавляем отступы и ограничиваем максимальную ширину тега
            let tagHeight = self.tagHeight
            
            if currentOriginX + tagWidth > bounds.width {
                currentOriginX = 0
                currentOriginY += tagHeight + tagSpacingY
            }
            
            // Применение ограничений для тега
            tagView.frame = CGRect(x: currentOriginX, y: currentOriginY, width: tagWidth, height: tagHeight)
            
            currentOriginX += tagWidth + tagSpacingX
        }
        
        // Расчет общей высоты TagListView на основе последнего тега
        let totalHeight = currentOriginY + tagHeight
        
        // Обновление высоты TagListView
        tagListViewHeightConstraint.constant = totalHeight
    }
    
    private func setupConstraints() {
        tagListViewHeightConstraint = heightAnchor.constraint(equalToConstant: 0)
        tagListViewHeightConstraint.isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    let view = TagListView()
    view.configure(for: ["3-я линия", "4242424", "242424", "242424", "242424", "242424", "242424", "2434", "242424"])
    view.backgroundColor = .orange
    return view
}
