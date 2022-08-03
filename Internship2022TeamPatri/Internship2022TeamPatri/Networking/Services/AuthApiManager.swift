//
//  AuthApiManager.swift
//  Internship2022TeamPatri
//
//  Created by Vlad Silviu Hagiu on 02.08.2022.
//

import Foundation
import FirebaseAuth
import UIKit
import FirebaseFirestore

class AuthApiManager {
    static let sharedInstance = AuthApiManager()
    private let db = Firestore.firestore()
    
    func loginAPI(email: String?, password: String?) {
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email ?? "default", password: password ?? "default", completion: { result, error in
            if error != nil  {
                print(error!.localizedDescription)
                //  self.alertMessage(title: "Something went wrong", userMessage: error!.localizedDescription)
            } else {
                print("Succesfully logged in")
                //self.alertMessage(title: "You are successfully logged in", userMessage: "Success!")
            }
        })
    }
}
















