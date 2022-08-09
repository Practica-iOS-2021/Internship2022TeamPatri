//
//  CoursesModel.swift
//  Internship2022TeamPatri
//
//  Created by Vlad Silviu Hagiu on 08.08.2022.
//

import Foundation

struct Courses: Decodable {
    let id: String
    let name: String
    let semester: Int
    let chapters: [ChapterModel]?
}

struct ChapterModel: Decodable {
    let id: String
    let name: String
    let questions: [Question]?
}

struct Question: Decodable {
    let id: String
    let question: String
    let answers: [String]
    let correctAnswer: Int
}
