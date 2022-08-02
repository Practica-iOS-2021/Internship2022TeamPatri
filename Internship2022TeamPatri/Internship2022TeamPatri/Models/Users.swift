//
//  Users.swift
//  Internship2022TeamPatri
//
//  Created by Coralia Diana Muresan on 02.08.2022.
//

import Foundation
import UIKit

struct ParentUser {
    let user: [Users]
}

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
