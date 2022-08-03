//
//  RetrieveUserData.swift
//  Internship2022TeamPatri
//
//  Created by Coralia Diana Muresan on 03.08.2022.
//

import Foundation
import FirebaseFirestore
import UIKit
import simd

class RetrieveUserData: ObservableObject {
    
    @Published var user = [Users]()
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("user").addSnapshotListener {(QuerySnapshot, error) in
            guard let documents = QuerySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.user = documents.map {(QueryDocumentSnapshot) -> Users in
                let data = QueryDocumentSnapshot.data()

                let name = data["Name"] as? String ?? ""
                let email = data["Email"] as? String ?? ""
                let personalID = data["PersonalID"] as? String ?? ""
                let studentID = data["StudentID"] as? String ?? ""
                let photo = data[""] as? UIImage ?? nil
                let chapter = data["Chapter"] as? String ?? ""
                let courses = data["Courses"] as? String ?? ""
                let grade = data["Grade"] as? Int ?? 0
                let semester = data["Semester"] as? Int ?? 0
                
                return Users(name: name, email: email, personalID: personalID, studentID: studentID, photo: photo, grades: Users.Grades(chapter: chapter, courses: courses, grade: grade, semester: semester))
            }
        }
    }
}
