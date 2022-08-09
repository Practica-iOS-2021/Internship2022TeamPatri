//
//  ReViewController.swift
//  Internship2022TeamPatri
//
//  Created by Coralia Diana Muresan on 29.07.2022.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet private weak var viewName: RegisterCustomView!
    @IBOutlet private weak var viewEmail: RegisterCustomView!
    @IBOutlet private weak var viewPersonalID: RegisterCustomView!
    @IBOutlet private weak var viewStudentID: RegisterCustomView!
    @IBOutlet private weak var viewPassword: RegisterCustomView!
    @IBOutlet private var backgroundView: UIView!
    @IBOutlet private weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewName.configureView(title: "Name")
        viewEmail.configureView(title: "Email")
        viewPersonalID.configureView(title: "Personal ID")
        viewStudentID.configureView(title: "Student ID")
        viewPassword.configureView(title: "Password")
        viewPassword.contentTextField.isSecureTextEntry = true
        config()
    }
    
    private func config(){
        
        // set background color
        backgroundView.backgroundColor = UIColor.colorBackground
        
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
        
        let userName = viewName.contentTextField.text
        let userEmail = viewEmail.contentTextField.text
        let userPersonalID = viewPersonalID.contentTextField.text
        let userStudentID = viewStudentID.contentTextField.text
        let userPassword = viewPassword.contentTextField.text
        
        [viewEmail.titleLabel, viewPersonalID.titleLabel, viewPassword.titleLabel].forEach {
                $0.textColor = UIColor.colorText
         }
        // check for empty fields
        if userName?.isEmpty == true || userEmail?.isEmpty == true || userPersonalID?.isEmpty == true || userStudentID?.isEmpty == true || userPassword?.isEmpty == true {
            alertMessage(userMessage: "All fields are required !!!")
        }
        else {
            // check for email validation
            if isValidEmail(emailID: userEmail ?? "") == false {
                alertMessage(userMessage: "Please enter valid email address!")
                viewEmail.titleLabel.textColor = .red
            } else {
                // check for personal ID validation
                if isValidID(personalID: userPersonalID ?? "") == false {
                    alertMessage(userMessage: "Please enter a correct and unique ID")
                    viewPersonalID.titleLabel.textColor = .red
                } else {
                    // check for password validation
                    // minimum eight characters, at least one letter, one number and one special character
                    if isValidPassword(password: userPassword ?? "") == false {
                        alertMessage(userMessage: "Please enter a valid password! (min 8 characters, one letter, one number and one special character)")
                        viewPassword.titleLabel.textColor = .red
                    } else {
                        let user = User(email: userEmail, name: userName, personalID: userPersonalID, studentID: userStudentID, password: userPassword, photo: "")
                        registerUser(user: user)
                    }
                }
            }
        }
    }
    
    // email validation
    func isValidEmail(emailID:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailID)
    }
    
    // personalID validation
    func isValidID(personalID:String) -> Bool {
        let idRegEx = "^[1-9]\\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\\d|3[01])(0[1-9]|[1-4]\\d|5[0-2]|99)(00[1-9]|0[1-9]\\d|[1-9]\\d\\d)\\d$"
        let idTest = NSPredicate(format:"SELF MATCHES %@", idRegEx)
        return idTest.evaluate(with: personalID)
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
    
    // FireBase register User
    private func registerUser(user: User) { 
        AuthApiRegister.sharedInstance.register(user: user) { success in
            if success {
                self.navigationController?.popViewController(animated: true)
            } else {
                self.alertMessage(userMessage: "Register Failed")
            }
        }
    }
}

// for keyboard issues
extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // dismiss keyboard
        viewName.contentTextField.resignFirstResponder()
        viewEmail.contentTextField.resignFirstResponder()
        viewPersonalID.contentTextField.resignFirstResponder()
        viewStudentID.contentTextField.resignFirstResponder()
        viewPassword.contentTextField.resignFirstResponder()
        return true
    }
}

