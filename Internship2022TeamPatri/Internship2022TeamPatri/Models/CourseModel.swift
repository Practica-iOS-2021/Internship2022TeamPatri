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

extension Course {
    static var mock: [Course] {
        return [
            Course(iconName: "Math", title: "Mathematics", grade: "10"),
            Course(iconName: "Biology", title: "Biology", grade: "9"),
            Course(iconName: "Chemistry", title: "Chemistry", grade: "7"),
            Course(iconName: "Informatics", title: "Informatics", grade: "9"),
        ]
    }
}

