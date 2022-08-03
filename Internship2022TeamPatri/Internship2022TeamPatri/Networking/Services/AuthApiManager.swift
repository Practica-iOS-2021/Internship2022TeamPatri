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
    
    func loginAPI(email: String?, password: String?, completion:  @escaping (Bool, Error?) -> Void) {
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email ?? "default", password: password ?? "default", completion: { result, error in
            if error != nil  {
                //print(error!.localizedDescription)
                completion(false, error )
            } else {
                //print("Succesfully logged in")
                completion(true, error)
            }
        })
    }
}
















