//
//  UIRegisterViewExtension.swift
//  Internship2022TeamPatri
//
//  Created by Coralia Diana Muresan on 29.07.2022.
//

import Foundation
import UIKit

extension UIView {
    
    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
