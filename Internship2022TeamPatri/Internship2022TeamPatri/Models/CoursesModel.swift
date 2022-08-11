//
//  CoursesModel.swift
//  Internship2022TeamPatri
//
//  Created by Vlad Silviu Hagiu on 10.08.2022.
//

import Foundation

struct Course: Decodable {
    let name: String
    let semester: Int
    //let chapters: [ChapterModel]?
}

struct ChapterModel: Decodable {
    let name: String
    let questions: [Question]?
}

struct Question: Decodable {
    let question: String
    let answers: [String]
    let correctAnswer: Int
}
