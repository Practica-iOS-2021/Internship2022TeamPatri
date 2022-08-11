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
    private var courses: [Courses] = []
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
    func getCoursesData(completion: @escaping ([Courses]?) -> Void) {
        let db = Firestore.firestore()
        
        if !courses.isEmpty {
            completion(courses)
        }
        db.collection("courses").getDocuments { [weak self] querySnapshor, error in
            if error != nil {
                completion(nil)
            } else {
                guard let self =  self else {return}
                var courses: [Courses] = []
                for document in querySnapshor?.documents ?? [] {
                    print("\(document.documentID) => \(document.data())")
                    
                    let data =  document.data()
                    let name = data["name"] as? String ?? ""
                    let semester = data["semester"] as? Int ?? 0
                    
                    let currentCourse = Courses(name: name, semester: semester)
                    courses.append(currentCourse)
                }
                self.courses = courses
                print(courses.count)
            }
            
        }
    }
}

