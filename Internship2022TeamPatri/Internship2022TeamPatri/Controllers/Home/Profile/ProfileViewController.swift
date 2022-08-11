//
//  ProfileViewController.swift
//  Internship2022TeamPatri
//
//  Created by Vlad Silviu Hagiu on 28.07.2022.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {
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
        navController(title: "Profile")
        fetchData()
    }

    // making the image round and set colors to labels
    private func configure() {
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
        [personalIDLabel, studentIDLabel, emailLabel, userNameProfile].forEach {
            $0.textColor = UIColor.colorLabelProfile
        }
        [personalIDTextLabel, studentIDTextLabel, emailTextLabel].forEach {
            $0.textColor = UIColor.colorTextProfile
        }
    }
    
    // showing the personal info of the user
    private func fetchData() {
        RetrieveUserData.shared.fetchPersonalInfo { users, error in
            self.profileImage.image = UIImage(named: users?.photo ?? "")
            self.userNameProfile.text = users?.name
            self.personalIDTextLabel.text = users?.personalID
            self.studentIDTextLabel.text = users?.studentID
            self.emailTextLabel.text = users?.email
        }
    }
    
    // making the customized navigation controller
    public func navController(title: String) {
        // adding the bottom shadow
        let shadowView = UIView(frame: self.navigationController!.navigationBar.frame)
        shadowView.backgroundColor = UIColor.white
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowOpacity = 0.22
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 5)
        shadowView.layer.shadowRadius = 3
        self.view.addSubview(shadowView)
        
        // adding the title
        let lbNavTitle = UILabel (frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        lbNavTitle.textColor = UIColor.colorText
        lbNavTitle.numberOfLines = 0
        lbNavTitle.center = CGPoint(x: 0, y: 0)
        lbNavTitle.textAlignment = .center
        lbNavTitle.text = title
        lbNavTitle.font = lbNavTitle.font.withSize(32)
        self.navigationItem.titleView = lbNavTitle
    }
        
    // sign out button
    @IBAction func logOut(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch let logOutError {
            print(logOutError)
        }
    }
}
