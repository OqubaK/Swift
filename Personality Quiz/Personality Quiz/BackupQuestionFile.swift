//
//  Question.swift
//  Personality Quiz
//
//  Created by Oquba Khan on 7/31/23.
//

import Foundation

struct rQuestion {
    var rtext: String
    var rtype: ResponseType
    var ranswers: [rAnswer]
}

enum rResponseType {
    case single, multiple, ranged
}

struct rAnswer {
    var text: String
    var rtype: rAnimalType
}

enum rAnimalType: Character {
    case dog = "🐶", cat = "🐱", rabbit = "🐰", turtle = "🐢"
    
    var definition:String {
        switch self {
        case .dog:
            return "You are incredibly outgoing. You surround yourself with the people you love and enjoy activities with your friends."
        case .cat:
            return "Mischievous, yet mild-tempered, you enjoy doing things on your own terms."
        case .rabbit:
            return "You love everything that’s soft. You are healthy and full of energy."
        case .turtle:
            return "You are wise beyond your years, and you focus on the details. Slow and steady wins the race."
        }
    }
}


// IF BACKUP NEEDS TO BE USED, REMOVE "r" FROM REQUIRED LINES
