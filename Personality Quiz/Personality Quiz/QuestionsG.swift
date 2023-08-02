//
//  Question.swift
//  Personality Quiz
//
//  Created by Oquba Khan on 7/31/23.
//

import Foundation

struct QuestionG {
    var text: String
    var type: ResponseTypeG
    var answers: [AnswerG]
}

enum ResponseTypeG {
    case single, multiple, ranged
}

struct AnswerG {
    var text: String
    var type: GameType
}


enum GameType: String {
    case HollowKnight = "Hollow Knight", LittleBigPlanet = "LittleBigPlanet", PWS = "PowerWash Simulator", RSS = "Rainbow Six Siege"
    
    var definition:String {
        switch self {
        case .HollowKnight:
            return "A medium to high difficulty game. Though it may feel difficult, it's enjoyable once you get the hang of it."
        case .LittleBigPlanet:
            return "A personal favorite of mine. A game about making levels or playing others' creations."
        case .PWS:
            return "Nothing more satisfying than powerwashing vehicles/houses/locations. Don't look at me like that, don't knock it till you try it!"
        case .RSS:
            return "A 5v5 FPS game. Highly competitive with a high skill curve."
        }
    }
}
