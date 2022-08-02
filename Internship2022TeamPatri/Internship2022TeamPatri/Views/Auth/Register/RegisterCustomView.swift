//
//  RegisterCustomView.swift
//  Internship2022TeamPatri
//
//  Created by Coralia Diana Muresan on 29.07.2022.
//

import UIKit

@IBDesignable
final class RegisterCustomView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentTextField: UITextField!
    @IBOutlet private weak var lineView: UIView!
    @IBOutlet private var backgroundCustomView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    required init?(coder: NSCoder){
        super.init(coder: coder)
        self.configureView()
    }
    private func configureView(){
        guard let view = self.loadViewFromNib(nibName: "RegisterCustomView") else {return}
        view.frame = self.bounds
        self.addSubview(view)
    }
    func configureView(title: String){
        titleLabel.text = title
        titleLabel.textColor = UIColor.colorText
        lineView.backgroundColor = UIColor.colorView
        backgroundCustomView.backgroundColor = UIColor.colorBackground
    }
}

