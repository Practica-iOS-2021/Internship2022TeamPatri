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
    @IBOutlet private var backgroundView: UIView!
    
    let colorView = UIColor(red: 124/255, green: 122/255, blue: 122/255, alpha: 1)
    let colorText = UIColor(red: 37/255, green: 22/255, blue: 5/255, alpha: 1)
    
    var view: UIView!
    
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
        self.titleLabel.text = title
        self.titleLabel.textColor = colorText
        self.lineView.backgroundColor = colorView
        backgroundView.backgroundColor = UIColor(red: 192/255, green: 239/255, blue: 243/255, alpha: 1)
    }
}

