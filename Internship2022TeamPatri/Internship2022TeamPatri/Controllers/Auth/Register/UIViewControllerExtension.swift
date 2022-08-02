//
//  UIRegisterViewControllerExtension.swift
//  Internship2022TeamPatri
//
//  Created by Coralia Diana Muresan on 02.08.2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        return instantiateFromNib()
    }
}
