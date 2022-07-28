//
//  Course.swift
//  Internship2022TeamPatri
//
//  Created by Eduard Sorin Caragea on 27.07.2022.
//

import Foundation

struct Course {
    let iconName: String
    let title: String
    let grade: String
}

let data: [Course] = [
    Course(iconName: "Math", title: "Mathematics", grade: "10"),
    Course(iconName: "Biology", title: "Biology", grade: "9"),
    Course(iconName: "Chemistry", title: "Chemistry", grade: "/"),
    Course(iconName: "Informatics", title: "Informatics", grade: "/"),
]
