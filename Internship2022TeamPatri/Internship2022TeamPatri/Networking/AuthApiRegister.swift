//
//  AuthApiRegister.swift
//  Internship2022TeamPatri
//
//  Created by Eduard Sorin Caragea on 03.08.2022.
//

import Foundation
import FirebaseAuth
import Firebase

class AuthApiRegister {
    
    static let sharedInstance = AuthApiRegister()
    func register(user: User, completion: @escaping (Bool) -> Void) {
        
        guard let email = user.email?.trimmingCharacters(in: .whitespacesAndNewlines),
              let name = user.name?.trimmingCharacters(in: .whitespacesAndNewlines),
              let personalID = user.personalID?.trimmingCharacters(in: .whitespacesAndNewlines),
              let studentID = user.studentID?.trimmingCharacters(in: .whitespacesAndNewlines),
              let password = user.password?.trimmingCharacters(in: .whitespacesAndNewlines),
              let photo = user.photo?.trimmingCharacters(in: .whitespaces)
        else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                completion(false)
            } else { // User was created, now store the dates
                let db = Firestore.firestore()
                guard let uid = result?.user.uid else { return }
                db.collection("users").document(uid).setData(["email":email, "name": name, "personalID": personalID, "studentID": studentID, "photo": photo]) { (error) in
                    if error != nil{
                        completion(false)
                    }
                }
            }
            completion(true)
        }
    }
}

