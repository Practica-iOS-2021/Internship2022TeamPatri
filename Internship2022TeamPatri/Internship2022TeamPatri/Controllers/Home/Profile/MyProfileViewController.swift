//
//  MyProfileViewController.swift
//  Internship2022TeamPatri
//
//  Created by Coralia Diana Muresan on 05.08.2022.
//

import UIKit

class MyProfileViewController: UIViewController {
    
    @IBOutlet private weak var profileImage: UIImageView!
    @IBOutlet private weak var userNameProfile: UILabel!
    @IBOutlet private weak var personalIDLabel: UILabel!
    @IBOutlet private weak var personalIDTextLabel: UILabel!
    @IBOutlet private weak var studentIDLabel: UILabel!
    @IBOutlet private weak var studentIDTextLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var emailTextLabel: UILabel!
    @IBOutlet private weak var logOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    // making the image round and set colors to labels and button
    private func configure(){
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
        [personalIDLabel, studentIDLabel, emailLabel, userNameProfile].forEach {
            $0.textColor = UIColor.colorLabelProfile
        }
        [personalIDTextLabel, studentIDTextLabel, emailTextLabel].forEach {
            $0.textColor = UIColor.colorTextProfile
        }
        logOutButton.titleLabel?.textColor = UIColor.colorLogOut
    }
    
    // sign out button
    @IBAction func logOut(_ sender: Any) {
        
    }
}
