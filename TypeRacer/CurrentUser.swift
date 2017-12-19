//
//  CurrentUser.swift
//  TypeRacer
//
//  Created by SAMEER SURESH on 10/20/16.
//  Copyright © 2016 trainingprogram. All rights reserved.
//

import Foundation
import Firebase

class CurrentUser {
    
    var dbRef: FIRDatabaseReference!
    var id: String?
    var completedGameIds: [String] = []
    
    init() {
        dbRef = FIRDatabase.database().reference()
        id = FIRAuth.auth()?.currentUser?.uid
        getCompletedGameIds { (_) in }
    }
    
    func setCompletedGames(games: [String]) {
        completedGameIds = games

    }
    
    func getCompletedGameIds(completion: @escaping ([String]?) -> Void) {
        dbRef.child("User/\(id!)").observeSingleEvent(of: .value, with: { snapshot -> Void in
            if snapshot.exists() {
                if let games = snapshot.value as? [String] {
                    self.completedGameIds = games
                    completion(games)
                }
            } else {
                completion(nil)
            }
        })
        
        /*
 
            Go to the current user's node ("User/\(id!)") and get the snapshot of their current data
            This should return snapshot where snapshot.value is of type [String]
            Set self.completedGameIds to this array
            Finally, call completion(self.completedGameIds)
         
            If error, call completion(nil)
 
        */
    }
    
    func addNewGame(wpm: Double, accuracy: Double, correct: String, input: String) -> Void {
        let gameDict: [String:AnyObject] = ["wordsPerMinute": wpm as AnyObject,
                                           "accuracy": accuracy as AnyObject,
                                           "correctString": correct as AnyObject,
                                           "inputString":input as AnyObject]
        GameAPI.saveToDBForKey(gameDict: gameDict) { (key) in
            if let key = key {
                self.completedGameIds.append(key)
                self.dbRef.child("User/\(self.id!)").setValue(self.completedGameIds)
            }
        }
        
        /*
         
            Call GameAPI.saveToDBForKey, passing in gameDict as a parameter.
            In the closure, get a key string and add this key to our self.completedGameIds
            Finally, save this new array on Firebase
 
        */
    }
    

}
