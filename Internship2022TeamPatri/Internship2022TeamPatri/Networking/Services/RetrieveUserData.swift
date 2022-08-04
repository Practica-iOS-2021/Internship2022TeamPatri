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
import simd

class RetrieveUserData: ObservableObject {
    
    @Published var userPersonalInfo = [UserPersonalInfo]()
    @Published var userGrades = [UserGrades]()
    private var db = Firestore.firestore()
    
    func fetchPersonalInfo() {
        db.collection("users").addSnapshotListener { [self](QuerySnapshot, error) in
            guard let documents = QuerySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.userPersonalInfo = documents.map {(QueryDocumentSnapshot) -> UserPersonalInfo in
                
                let data = QueryDocumentSnapshot.data()
                
                let name = data["Name"] as? String ?? ""
                let email = data["Email"] as? String ?? ""
                let personalID = data["PersonalID"] as? String ?? ""
                let studentID = data["StudentID"] as? String ?? ""
                let photo = data[""] as? UIImage ?? nil
                
                return UserPersonalInfo(name: name, email: email, personalID: personalID, studentID: studentID, photo: photo)
            }
        }
    }

    func fetchGrades() {
        db.collection("users").addSnapshotListener {(QuerySnapshot, error) in
            guard let documents = QuerySnapshot?.documents else {
                print("No documents")
                return
            }
                
            self.userGrades = documents.map {(QueryDocumentSnapshot) -> UserGrades in
                        
                let data = QueryDocumentSnapshot.data()
                
                let chapter = data["Chapter"] as? String ?? ""
                let course = data["Course"] as? String ?? ""
                let grade = data["Grade"] as? Int ?? 0
                let semester = data["Semester"] as? Int ?? 0
                        
                return UserGrades(grades: [UserGrades.Grade(chapter: chapter, course: course, grade: grade, semester: semester)])
            }
        }
    }
}

    /*
    private func getDocument() {
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
