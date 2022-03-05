//
//  Genre.swift
//  TableViewDemo
//
//  Created by Young Ju on 2/23/22.
//

import Foundation


struct Question {
    private(set) public var divisionService: String
    private(set) public var questionNumber: String
    private(set) public var questionAsked: String
    
    init(divisionService: String, questionNumber: String, questionAsked: String) {
        self.divisionService = divisionService
        self.questionNumber = questionNumber
        self.questionAsked = questionAsked
    }
}
