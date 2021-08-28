//
//  UiViewExtension.swift
//  task
//
//  Created by Boo Doo on 8/26/21.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var isHalfRounded: Bool {
        get {
            return layer.cornerRadius == layer.bounds.size.height / 2
        } set {
            clipsToBounds = true
            layer.cornerRadius = layer.bounds.size.height / 2
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        } set {
            layer.cornerRadius = newValue
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        } set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor(cgColor: layer.borderColor ?? UIColor.clear.cgColor)
        } set {
            layer.borderColor = newValue.cgColor
        }
    }

    @IBInspectable internal var shadow_Color: UIColor {
        get {
            return UIColor(cgColor: layer.shadowColor ?? UIColor.clear.cgColor)
        } set {
            layer.shadowColor = newValue.cgColor
        }
    }

    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        } set {
            layer.shadowOpacity = newValue
        }
    }

    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        } set {
            layer.shadowRadius = newValue
        }
    }

    @IBInspectable var shadowOffsetX: CGFloat {
        get {
            return layer.shadowOffset.width
        } set {
            layer.shadowOffset = CGSize(width: newValue, height: layer.shadowOffset.height)
        }
    }

    @IBInspectable var shadowOffsetY: CGFloat {
        get {
            return layer.shadowOffset.height
        } set {
            layer.shadowOffset = CGSize(width: layer.shadowOffset.width, height: newValue)
        }
    }
       func roundCorners(corners: UIRectCorner, radius: CGFloat) {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
        }
}
