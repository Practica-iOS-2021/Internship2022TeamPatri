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
    
    func fetchPersonalInfo() {
        self.db.collectionGroup("users").getDocuments { (snapshot, error) in
            if let err = error {
                print(err)
            }else
             {
                if let snapshot = snapshot,snapshot.documents.count > 0 {
                    for document in snapshot.documents {
                        print(document.data())
                    }
                }
             }
        }
    }
    
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


/*
class RetrieveUserData {
    
    var user = [User]()
    private var db = Firestore.firestore()
    
    func fetchUserData() {
        db.collection("users").addSnapshotListener { [self](QuerySnapshot, error) in
            guard let documents = QuerySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.user = documents.map {(QueryDocumentSnapshot) -> User in
                
                let data = QueryDocumentSnapshot.data()
                
                let name = data["Name"] as? String ?? ""
                let email = data["Email"] as? String ?? ""
                let personalID = data["PersonalID"] as? String ?? ""
                let studentID = data["StudentID"] as? String ?? ""
                let photo = data[""] as? UIImage ?? nil
                let chapter = data["Chapter"] as? String ?? ""
                let course = data["Course"] as? String ?? ""
                let grade = data["Grade"] as? Int ?? 0
                let semester = data["Semester"] as? Int ?? 0
                
                return User(name: name, email: email, personalID: personalID, studentID: studentID, photo: photo, grades: [User.Grade(chapter: chapter, course: course, grade: grade, semester: semester)])
            }
        }
    }
}
*/

/*
    func getDocument() {
        //Get specific document from current user
        let docRef = Firestore.firestore()
                              .collection("users")
                              .whereField("uid", isEqualTo: Auth.auth().currentUser?.uid ?? "")
        
        // Get data
        docRef.getDocuments { (querySnapshot, err) in
            if let err = err {
                print(err.localizedDescription)
            } else if querySnapshot!.documents.count != 1 {
                print("More than one document or none")
            } else {
                let document = querySnapshot!.documents.first
                let dataDescription = document?.data()
                guard let name = dataDescription?["name"] else { return }
                print(name)
            }
        }
    }
*/
