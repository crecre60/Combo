//
//  DataService.swift
//  TableViewDemo
//
//  Created by Young Ju on 2/23/22.
//

import Foundation

class DataService {
    static let instance = DataService()
    
    private let divisions = ["room", "restaurant", "gym"]
    
    private let gradeImages = [
        "hand.thumbsup",
        "face.smiling",
        "hand.thumbsdown",
        "hand.thumbsup.fill",
        "face.smiling.fill",
        "hand.thumbsdown.fill"
    ]
    
    private let Questions = [
        Question(divisionService: "room", questionNumber: "Q1", questionAsked: "Was your stay pleasant and comfortable?"),
        Question(divisionService: "room", questionNumber: "Q2", questionAsked: "Did the room service meet your expections?"),
        Question(divisionService: "room", questionNumber: "Q3", questionAsked: "How was the overall visit?"),
        Question(divisionService: "restaurant", questionNumber: "Q1", questionAsked: "Have you enjoyed our cousine?"),
        Question(divisionService: "restaurant", questionNumber: "Q2", questionAsked: "Did the restaurnat service meet your expections?"),
        Question(divisionService: "restaurant", questionNumber: "Q3", questionAsked: "How was the overall visit?"),
        Question(divisionService: "gym", questionNumber: "Q1", questionAsked: "How did you enjoyed the facilities of Mars Gym?"),
        Question(divisionService: "gym", questionNumber: "Q2", questionAsked: "Did the gym service meet your expections?"),
        Question(divisionService: "gym", questionNumber: "Q3", questionAsked: "How was the overall visit?")
    ]
    
    func getDivision(seq: Int)  -> String {
        return divisions[seq]
    }
    
    func getQuestions(division: String)  -> [Question] {
        
        return Questions.filter {$0.divisionService == division}
    }
    
    func getGradeImage(img: Int)  -> String {
        return gradeImages[img]
    }

    
}
