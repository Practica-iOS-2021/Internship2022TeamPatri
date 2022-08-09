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
    
    let grades: [Grade]?
}

struct Grade {
    let chapter: String
    let course: String
    let grade: Int
    let semester: Int
}
