//
//  Users.swift
//  Internship2022TeamPatri
//
//  Created by Coralia Diana Muresan on 02.08.2022.
//

import Foundation
import UIKit

struct User {
    let name: String
    let email: String
    let personalID: String
    let studentID: String
    let photo: UIImage?
    
    let grades: [Grade]?
}

struct Grade {
    let chapter: String
    let course: String
    let grade: Int
    let semester: Int
}


let user = User(name: "ALexandru", email: "alex@yahoo.com", personalID: "2990324125748", studentID: "2345", photo: nil, grades: [Grade(chapter: "C++", course: "Informatics", grade: 9, semester: 1)])
