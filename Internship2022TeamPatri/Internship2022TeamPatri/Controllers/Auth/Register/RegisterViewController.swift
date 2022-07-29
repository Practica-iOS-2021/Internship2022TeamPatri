//
//  RegisterViewController.swift
//  Internship2022TeamPatri
//
//  Created by Coralia Diana Muresan on 28.07.2022.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak private var registerButton: UIButton!
    @IBOutlet private var backgroundView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var personalIDLabel: UILabel!
    @IBOutlet private weak var studentIDLabel: UILabel!
    @IBOutlet private weak var passwordLabel: UILabel!
    @IBOutlet private weak var view1: UIView!
    @IBOutlet private weak var view2: UIView!
    @IBOutlet private weak var view3: UIView!
    @IBOutlet private weak var view4: UIView!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var personalIDTextField: UITextField!
    @IBOutlet private weak var studentIDTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    let colorText = UIColor(red: 37/255, green: 22/255, blue: 5/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        config()
    }
    
    private func config(){
        // set background color
        backgroundView.backgroundColor = UIColor(red: 192/255, green: 239/255, blue: 243/255, alpha: 1)
        
        // set the text color
        registerButton.titleLabel?.textColor = colorText
        titleLabel.textColor = colorText
        emailLabel.textColor = colorText
        personalIDLabel.textColor = colorText
        studentIDLabel.textColor = colorText
        passwordLabel.textColor = colorText
        
        // set the view colors
        let colorView = UIColor(red: 124/255, green: 122/255, blue: 122/255, alpha: 1)
        view1.backgroundColor = colorView
        view2.backgroundColor = colorView
        view3.backgroundColor = colorView
        view4.backgroundColor = colorView
        
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
    
    @IBAction private func registerFunc(_ sender: Any) {
        let userEmail = emailTextField.text
        let userPersonalID = personalIDTextField.text
        let userStudentID = studentIDTextField.text
        let userPassword = passwordTextField.text
        
        // check for empty fields
        if userEmail?.isEmpty == true || userPersonalID?.isEmpty == true || userStudentID?.isEmpty == true || userPassword?.isEmpty == true {
            alertMessage(userMessage: "All fields are required !!!")
        }
        else {
            // check for email validation
            if isValidEmail(emailID: userEmail ?? "") == false {
                alertMessage(userMessage: "Please enter valid email address!")
                emailLabel.textColor = .red
            } else {
                // check for password validation
                // minimum eight characters, at least one letter, one number and one special character
                if isValidPassword(password: userPassword ?? "") == false {
                    alertMessage(userMessage: "Please enter a valid password! (min 8 characters, one letter, one number and one special character)")
                    emailLabel.textColor = colorText
                    passwordLabel.textColor = .red
                } else {
                    // register data is all good
                    alertMessage(userMessage: "All good! :)")
                    passwordLabel.textColor = colorText
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
        emailTextField.resignFirstResponder()
        personalIDTextField.resignFirstResponder()
        studentIDTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
}
