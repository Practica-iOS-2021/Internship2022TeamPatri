//
//  Users.swift
//  Internship2022TeamPatri
//
//  Created by Coralia Diana Muresan on 02.08.2022.
//

import Foundation
import UIKit

struct Users {
    let name: String
    let email: String
    let personalID: String
    let studentID: String
    let photo: UIImage?
    let grades : Grades
    
    struct Grades {
        let chapter: String
        let courses: String
        let grade: Int
        let semester: Int
    }
}

let testUser = Users(name: "Alexandra", email: "ale@yahoo.com", personalID: "12345678", studentID: "12345678", photo: nil, grades: Users.Grades(chapter: "C++", courses: "Informatics", grade: 9, semester: 1))
