//
//  RetrieveUserData.swift
//  Internship2022TeamPatri
//
//  Created by Coralia Diana Muresan on 10.08.2022.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import UIKit

class RetrieveUserData {
    
    static let shared = RetrieveUserData()
    private var db = Firestore.firestore()
    
    // function to get user personal information
    func fetchPersonalInfo(completion: @escaping (Users?, String?) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let docRef = db.collection("users").document(uid)
        docRef.getDocument { (document, error) in
            guard error == nil else {
                print("error", error ?? "")
                completion(nil, error?.localizedDescription)
                return
            }
            guard let document = document, document.exists else {
                completion(nil, "Could not get user document")
                return }
            let data = document.data()
            if let data = data {
                let name = data["name"] as? String ?? ""
                let email = data["email"] as? String ?? ""
                let personalID = data["personalID"] as? String ?? ""
                let studentID = data["studentID"] as? String ?? ""
                let photo = data["photo"] as? String ?? ""
                
                let currentUser = Users(name: name, email: email, personalID: personalID, studentID: studentID, photo: photo)
                completion(currentUser, nil)
            }
        }
    }
}
