//
//  Question.swift
//  Personality Quiz
//
//  Created by Oquba Khan on 7/31/23.
//

import Foundation

struct QuestionV {
    var text: String
    var type: ResponseTypeV
    var answers: [AnswerV]
}

enum ResponseTypeV {
    case single, multiple, ranged
}

struct AnswerV {
    var text: String
    var type: VacationType
}


enum VacationType: String {
    case NewYork = "New York", Vancouver = "Vancouver", Paris = "Paris", Dubai = "Dubai"
    
    var definition:String {
        switch self {
        case .NewYork:
            return "A lovely city to go and see."
        case .Vancouver:
            return "A beautiful area with lots of mountains and bodies of water. Try hiking or boating."
        case .Paris:
            return "Ah, the city of love. Go see the Eifel tower, enjoy the weather."
        case .Dubai:
            return "Tired of the cold are we? Dubai is an amazing city to visit for shopping. Something everyone should experience"
        }
    }
}
