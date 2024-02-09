//
//  UIView+CornerRadius.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 03.02.2024.
//

import UIKit

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
}
