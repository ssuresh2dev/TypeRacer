//
//  Game.swift
//  TypeRacer
//
//  Created by SAMEER SURESH on 10/20/16.
//  Copyright © 2016 trainingprogram. All rights reserved.
//

import Foundation

struct Game {
    var id: String!
    var wpm: Double?
    var accuracy: Double?
    var correctString: String?
    var inputString: String?
    
    init(id: String, gameDict: [String: AnyObject]?) {
        self.id = id
        if let wpm = gameDict!["wordsPerMinute"] as? Double {
            self.wpm = wpm
        }
        if let accuracy = gameDict!["accuracy"] as? Double {
            self.accuracy = accuracy
        }
        if let correctString = gameDict!["correctString"] as? String {
            self.correctString = correctString
        }
        if let inputString = gameDict!["inputString"] as? String {
            self.inputString = inputString
        }
    }
    
}
