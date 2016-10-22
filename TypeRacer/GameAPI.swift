//
//  GameAPI.swift
//  TypeRacer
//
//  Created by SAMEER SURESH on 10/20/16.
//  Copyright © 2016 trainingprogram. All rights reserved.
//

import Foundation
import Firebase

class GameAPI {
    
    static var dbRef: FIRDatabaseReference = FIRDatabase.database().reference()
    
    static func saveToDBForKey(gameDict: [String:AnyObject], block: @escaping (String?) -> Void) {
        let key = dbRef.child("Game").childByAutoId().key
        dbRef.child("Game/\(key)").setValue(gameDict) { (error, reference) in
            if let error = error {
                print(error)
                block(nil)
            } else {
                block(key)
            }
        }
    }
    
    static func getGameFromId(id: String, block: @escaping (Game?) -> Void) {
        dbRef.child("Game/\(id)/").observe(.value, with: { (snapshot) in
            if snapshot.exists() {
                if let gameDict = snapshot.value as? [String: AnyObject] {
                    let game = Game(id: id, gameDict: gameDict)
                    block(game)
                }
            } else {
                block(nil)
            }

        })
    }
    
}
