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
    
    var coursesList = [Courses]()
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
    
    func getCourses(completion: @escaping ([Courses]?) -> Void) {
        let db = Firestore.firestore()
        
        db.collection("courses").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    
                    let courses = snapshot.documents.map { document -> Courses in
                        
//                        let chapters = document.collection("chapters").map { chapters -> ChapterModel in
//                            return ChapterModel(
//                                id: (chapters as AnyObject).documentID,
//                                name: chapters["name"] as? String ?? "",
//                                questions: chapters["questions"] as? [Question])
//                        }
//
//                        let questions = chapters["questions"].map { question ->
//                            Question in
//                            return Question(
//                                id: question.documentID,
//                                question: question["question"],
//                                answers: question["answers"],
//                                correctAnswer: question["correctAnswer"])
//
//                        }
                        return Courses(
                            id: document.documentID,
                            name: document["name"] as? String ?? "",
                            semester: document["semester"] as? Int ?? 0,
                            chapters: document["chapters"] as? [ChapterModel])
                        
                    }
                    completion(courses)
                } else {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }
    }
}


//if let snapshot = snapshot {
//    DispatchQueue.main.async {
//        self.coursesList = snapshot.documents.map { document in
//            return Courses(id: document.documentID,
//                           name: document["name"] as? String ?? "",
//                           semester: document["semester"] as? Int ?? 0,
//                           chapters: document["chapters"] as! [Chapter] )
//        }
//    }
//}
//print(self.coursesList)
