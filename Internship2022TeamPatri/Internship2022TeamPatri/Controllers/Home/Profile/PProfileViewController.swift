//
//  PProfileViewController.swift
//  Internship2022TeamPatri
//
//  Created by Coralia Diana Muresan on 08.08.2022.
//

import UIKit

class PProfileViewController: UIViewController {
    
    @IBOutlet private weak var profileImage: UIImageView!
    @IBOutlet private weak var userNameProfile: UILabel!
    @IBOutlet private weak var personalIDLabel: UILabel!
    @IBOutlet private weak var personalIDTextLabel: UILabel!
    @IBOutlet private weak var studentIDLabel: UILabel!
    @IBOutlet private weak var studentIDTextLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var emailTextLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        /*
        let profileViewController = PProfileViewController.loadFromNib()
        self.navigationController?.pushViewController(profileViewController, animated: true)
        self.navigationController?.navigationBar.tintColor = UIColor.colorText
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Profile", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
         */
    }

    // making the image round and set colors to labels
    private func configure(){
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
        [personalIDLabel, studentIDLabel, emailLabel, userNameProfile].forEach {
            $0.textColor = UIColor.colorLabelProfile
        }
        [personalIDTextLabel, studentIDTextLabel, emailTextLabel].forEach {
            $0.textColor = UIColor.colorTextProfile
        }
    }
    
    // sign out button
    @IBAction func logOut(_ sender: Any) {
        
    }
}
