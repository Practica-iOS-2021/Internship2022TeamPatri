//
//  ReViewController.swift
//  Internship2022TeamPatri
//
//  Created by Coralia Diana Muresan on 29.07.2022.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet private weak var view1: RegisterCustomView!
    @IBOutlet private weak var view2: RegisterCustomView!
    @IBOutlet private weak var view3: RegisterCustomView!
    @IBOutlet private weak var view4: RegisterCustomView!
    @IBOutlet private var backgroundView: UIView!
    @IBOutlet private weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view1.configureView(title: "Email:")
        self.view2.configureView(title: "Personal ID:")
        self.view3.configureView(title: "Student ID:")
        self.view4.configureView(title: "Password:")
        view4.contentTextField.isSecureTextEntry = true
        config()
    }
    
    private func config(){
        
        // set background color
        backgroundView.backgroundColor = UIColor(red: 192/255, green: 239/255, blue: 243/255, alpha: 1)
        
        // set the color and round corners for the register button
        registerButton.backgroundColor = .white
        registerButton.layer.cornerRadius = 20
        registerButton.clipsToBounds = true
 
        // set the shadow for the register button
        registerButton.layer.masksToBounds = false
        registerButton.layer.shadowRadius = 0.0
        registerButton.layer.shadowOpacity = 1.0
        registerButton.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        registerButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
    }
    
    @IBAction private func registerFunction(_ sender: Any) {

        let userEmail = view1.contentTextField.text
        let userPersonalID = view2.contentTextField.text
        let userStudentID = view3.contentTextField.text
        let userPassword = view4.contentTextField.text
        let colorText = UIColor(red: 37/255, green: 22/255, blue: 5/255, alpha: 1)
        
        // check for empty fields
        if userEmail?.isEmpty == true || userPersonalID?.isEmpty == true || userStudentID?.isEmpty == true || userPassword?.isEmpty == true {
            alertMessage(userMessage: "All fields are required !!!")
        }
        else {
            // check for email validation
            if isValidEmail(emailID: userEmail ?? "") == false {
                alertMessage(userMessage: "Please enter valid email address!")
                view1.titleLabel.textColor = .red
                view4.titleLabel.textColor = colorText
            } else {
                // check for password validation
                // minimum eight characters, at least one letter, one number and one special character
                if isValidPassword(password: userPassword ?? "") == false {
                    alertMessage(userMessage: "Please enter a valid password! (min 8 characters, one letter, one number and one special character)")
                    view1.titleLabel.textColor = colorText
                    view4.titleLabel.textColor = .red
                } else {
                    // register data is all good
                    alertMessage(userMessage: "All good! :)")
                    view1.titleLabel.textColor = colorText
                    view4.titleLabel.textColor = colorText
                }
            }
        }
        alertMessage(userMessage: "Something is not working")
    }
    
    // email validation
    func isValidEmail(emailID:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailID)
    }
    
    // password validation
    func isValidPassword(password: String) -> Bool {
        let passwordreg =  ("(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z])(?=.*[@#$%^&*]).{8,}")
        let passwordtesting = NSPredicate(format: "SELF MATCHES %@", passwordreg)
            return passwordtesting.evaluate(with: password)
    }
    
    // alert for text fields
    func alertMessage(userMessage: String){
        let myAllert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        myAllert.addAction(ok)
        present(myAllert, animated: true, completion: nil)
    }
}

// for keyboard issues
extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // dismiss keyboard
        view1.contentTextField.resignFirstResponder()
        view2.contentTextField.resignFirstResponder()
        view3.contentTextField.resignFirstResponder()
        view4.contentTextField.resignFirstResponder()
        return true
    }
}
