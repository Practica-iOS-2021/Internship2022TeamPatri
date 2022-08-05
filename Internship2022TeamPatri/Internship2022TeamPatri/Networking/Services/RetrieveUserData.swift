//
//  RetrieveUserData.swift
//  Internship2022TeamPatri
//
//  Created by Coralia Diana Muresan on 03.08.2022.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import UIKit


class RetrieveUserData {
    
    var userInfo = [User]()
    private var db = Firestore.firestore()
    
    // function to get user personal information
    func fetchPersonalInfo() {
        let docRef = db.collection("users").document("6qHknXlDHCcFhBVxZpXBcD5eJJH2")

        docRef.getDocument { (document, error) in
            guard error == nil else {
                print("error", error ?? "")
                return
            }
            if let document = document, document.exists {
                let data = document.data()
                if let data = data {
                    print(data)
                }
            }

        }
    }
    
    // function to get user grades
    func fetchGrades() {
        self.db.collection("users").document("6qHknXlDHCcFhBVxZpXBcD5eJJH2").collection("grades").getDocuments { (snapshot, error) in
                if let err = error {
                    print(err)
                } else
                 {
                    if let snapshot = snapshot,snapshot.documents.count > 0 {
                        for document in snapshot.documents {
                            print(document.data())
                        }
                    }
                 }
          }
    }
}
