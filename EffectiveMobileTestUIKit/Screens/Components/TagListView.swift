//
//  TagListView.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 06.02.2024.
//

import UIKit

class TagListView: UIView {
    
    // MARK: - Properties
    
    // Массив для хранения представлений тегов
    private var tagViews: [TagView] = []
    private let tagHeight: CGFloat = 28
    private let tagSpacingX: CGFloat = 8
    private let tagSpacingY: CGFloat = 8
    
    // Ограничение высоты TagListView
    private var tagListViewHeightConstraint: NSLayoutConstraint!
    
    
    // MARK: - Public Methods
    
    /// Настройка TagListView с заданными тегами и опциональным флагом для последнего тега
    /// - Parameters:
    ///   - tags: Массив строковых значений для создания тегов
    ///   - isLastTagButton: Флаг, указывающий, должен ли последний тег быть кнопкой
    func configure(for tags: [String], isLastTagButton: Bool = false) {
        
        // Удаляем все текущие теги из представления
        tagViews.forEach { $0.removeFromSuperview() }
        tagViews.removeAll()
        
        // Создаем и добавляем теги на основе переданных данных
        tags.forEach {
            // Проверяем, является ли текущий тег последним и должен ли он быть кнопкой
            let tagView = TagView(tagText: $0)
            
            tagViews.append(tagView)
            addSubview(tagView)
            tagView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        if isLastTagButton {
            let tagView = TagView(tagText: "Подробнее о номере", isButton: true)
            tagViews.append(tagView)
            addSubview(tagView)
            tagView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // Вызываем пересчет layout после добавления новых тегов
        setNeedsLayout()
    }
    
    // MARK: - Lifecycle Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layoutTags()
    }
    
    // MARK: - Private Methods

    /// Располагает теги в представлении с учетом их размеров и ограничений
    private func layoutTags() {
        var currentOriginX: CGFloat = 0
        var currentOriginY: CGFloat = 0
        
        tagViews.forEach { tagView in
            // Расчет размеров тега на основе его текста и размера стрелки
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
    
    // Установка ограничений для TagListView
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
