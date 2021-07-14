//
//  Extensions.swift
//  practicingBackDrop
//
//  Created by Decagon on 10/07/2021.
//

import Foundation
import UIKit

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.cornerRadius
        } set {
            self.layer.cornerRadius = newValue
        }
    }
    
    private var identifier: String {
        return String(describing: self)
    }
}
