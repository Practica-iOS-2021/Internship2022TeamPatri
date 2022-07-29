//
//  ViewController.swift
//  Internship2022TeamPatri
//
//  Created by Szabolcs Orban on 25.07.2022.
//

import UIKit
import SnapKit

class LogInViewController: UIViewController {
    
    @IBOutlet weak private var passwordLabel: UILabel!
    @IBOutlet weak private var emailLabel: UILabel!
    @IBOutlet weak private var logInLabel: UILabel!
    @IBOutlet weak private var emailTextField: UITextField!
    @IBOutlet weak private var passwordTextField: UITextField!
    @IBOutlet weak private var loginButton: UIButton!
    @IBOutlet weak private var notRegisteredLabel: UILabel!
    @IBOutlet weak private var signupButton: UIButton!
    @IBOutlet weak private var forgotPasswordButton: UIButton!
    
    let yourAttributesSignUp: [NSAttributedString.Key: Any] = [
          .underlineStyle: NSUnderlineStyle.single.rawValue,
          .font: UIFont.boldSystemFont(ofSize: 18),
      ]
    let yourAttributes: [NSAttributedString.Key: Any] = [
          .underlineStyle: NSUnderlineStyle.single.rawValue
      ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Make the keyboard disappear touching anywhere
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        
        // Styling Sign up and forgot password buttons
        let attributeString = NSMutableAttributedString(
              string: "Sign up",
              attributes: yourAttributesSignUp
           )
        let attributeStringForgotPassword = NSMutableAttributedString(
              string: "Forgot password?",
              attributes: yourAttributes
           )
        signupButton.setAttributedTitle(attributeString, for: .normal)
        forgotPasswordButton.setAttributedTitle(attributeStringForgotPassword, for: .normal)
        
        setUpElements()
    }
    
    private func setUpElements() {
        logInLabel.textColor = .colorText
        signupButton.tintColor = .colorText
        forgotPasswordButton.tintColor = .colorText
        notRegisteredLabel.textColor = .colorText
        
        logInLabel.font = UIFont.boldSystemFont(ofSize: 35)
        signupButton.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        
        Utilities.styleTextField(textfield: emailTextField)
        Utilities.styleTextField(textfield: passwordTextField)
        Utilities.styleLogInButton(button: loginButton)
        Utilities.styleShadowButton(button: loginButton)
        
        emailTextField.attributedPlaceholder = NSAttributedString(string: "", attributes: [
            .foregroundColor: UIColor.black,
            .font: UIFont.boldSystemFont(ofSize: 16.0)
        ])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "", attributes: [
            .foregroundColor: UIColor.black,
            .font: UIFont.boldSystemFont(ofSize: 16.0)
        ])
    }
    
    @IBAction private func loginTapped(_ sender: Any) {
        let userEmail = emailTextField.text
        let userPassword = passwordTextField.text
        
        if userEmail == "" || userPassword == "" {
            alertMessage(userMessage: "All fields are required")
        } else {
            let mail = isValidEmail(emailID: userEmail)
            if mail == false {
                alertMessage(userMessage: "Please enter a valid email addres!")
                emailLabel.textColor = .red
            } else {
                if isValidPassword(password: userPassword) == false {
                    alertMessage(userMessage: "Please enter a valid password!")
                    emailLabel.textColor = .colorText
                    passwordLabel.textColor = .red
                } else {
                    alertMessage(userMessage: "Success!")
                    passwordLabel.textColor = .colorText
                }
            }
        }
    }
    
    @IBAction private func signupTapped(_ sender: Any) {
    }

    //Email validation
    private func isValidEmail(emailID: String?) ->Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailID)
    }
    
    //Password validation
    private func isValidPassword(password: String?) ->Bool{
        let passwordReg = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$"
        let passwordTesting = NSPredicate(format: "SELF MATCHES %@", passwordReg)
        return passwordTesting.evaluate(with: password)
    }
    
    //Alert
    private func alertMessage(userMessage: String) {
        let myAllert = UIAlertController(title: "Something went wrong", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:  nil)
        myAllert.addAction(ok)
        present(myAllert, animated: true, completion: nil)
    }
   
    class Utilities {
    //Style the text fields
    final class func styleTextField(textfield:UITextField) {
        // Create the bottom line
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 1)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        
        // Remove border
        textfield.borderStyle = .none
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
    }
    
    //Style the Log in Button
    final class func styleLogInButton(button: UIButton) {
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 15
        button.tintColor = UIColor.black
    }
    
    // Adding shadow to the button
    final class func styleShadowButton(button: UIButton) {
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 0.0
        button.layer.masksToBounds = false
    }
}
}

extension UIColor{
   static let colorText = UIColor(red: 37/255, green: 22/255, blue: 5/255, alpha: 1)
   static let colorView = UIColor(red: 124/255, green: 122/255, blue: 122/255, alpha: 1)
}

