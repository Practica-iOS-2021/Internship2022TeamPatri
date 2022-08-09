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
    
    var userInfo = [Users]()
    private var db = Firestore.firestore()
    
    // function to get user personal information
    func fetchPersonalInfo() {
        db.collection("users").addSnapshotListener { [self](QuerySnapshot, error) in
            guard let documents = QuerySnapshot?.documents else {
                print("No documents")
                return
            }
            self.userInfo = documents.map {(QueryDocumentSnapshot) -> Users in
                       
            let data = QueryDocumentSnapshot.data()
                       
            let name = data["Name"] as? String ?? ""
            let email = data["Email"] as? String ?? ""
            let personalID = data["PersonalID"] as? String ?? ""
            let studentID = data["StudentID"] as? String ?? ""
            let photo = data["Photo"] as? String ?? ""
            let chapter = data["Chapter"] as? String ?? ""
            let course = data["Course"] as? String ?? ""
            let grade = data["Grade"] as? Int ?? 0
            let semester = data["Semester"] as? Int ?? 0
                       
            return Users(name: name, email: email, personalID: personalID, studentID: studentID, photo: photo, grades: [Grade(chapter: chapter, course: course, grade: grade, semester: semester)])
            }
        }

    }
    
    // function to get user grades
    func fetchGrades() {
        db.collection("users").document("6qHknXlDHCcFhBVxZpXBcD5eJJH2").collection("grades").addSnapshotListener { [self](QuerySnapshot, error) in
                guard let documents = QuerySnapshot?.documents else {
                    print("No documents")
                    return
                }
                self.userInfo = documents.map {(QueryDocumentSnapshot) -> Users in
                      
                let data = QueryDocumentSnapshot.data()
                    
                let name = data["Name"] as? String ?? ""
                let email = data["Email"] as? String ?? ""
                let personalID = data["PersonalID"] as? String ?? ""
                let studentID = data["StudentID"] as? String ?? ""
                let photo = data["Photo"] as? String ?? ""
                let chapter = data["Chapter"] as? String ?? ""
                let course = data["Course"] as? String ?? ""
                let grade = data["Grade"] as? Int ?? 0
                let semester = data["Semester"] as? Int ?? 0
                      
                return Users(name: name, email: email, personalID: personalID, studentID: studentID, photo: photo, grades: [Grade(chapter: chapter, course: course, grade: grade, semester: semester)])
            }
        }
    }
}
