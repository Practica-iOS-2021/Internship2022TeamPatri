//
//  Course.swift
//  Internship2022TeamPatri
//
//  Created by Eduard Sorin Caragea on 27.07.2022.
//

import Foundation

struct Grade {
    let iconName: String
    let title: String
    let grade: String
}

extension Grade {
    static var mock: [Grade] {
        return [
            Grade(iconName: "Math", title: "Mathematics", grade: "10"),
            Grade(iconName: "Biology", title: "Biology", grade: "9"),
            Grade(iconName: "Chemistry", title: "Chemistry", grade: "/"),
            Grade(iconName: "Informatics", title: "Informatics", grade: "/"),
        ]
    }
}

