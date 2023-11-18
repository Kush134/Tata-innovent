//
//  UIView+Extension.swift
//  Metrics
//
//  Created by Devjyoti Mohanty on 01/03/23.
//

import Foundation
import UIKit

extension UIView{
    @IBInspectable var cornerRadius: CGFloat{
        get { return self.cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
