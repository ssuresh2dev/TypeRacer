//
//  StringGenerator.swift
//  TypeRacer
//
//  Created by SAMEER SURESH on 10/21/16.
//  Copyright © 2016 trainingprogram. All rights reserved.
//

import Foundation

class StringGenerator {
    
    static let strings =
    [
        "They're coming in illegally. Drugs are pouring in through the border. We have no country if we have no border.",
        "Now, I want to build the wall. We need the wall. And the Border Patrol, ICE, they all want the wall.",
        "But we have some bad hombres here, and we're going to get them out.",
        "First of all, I had a very good meeting with the president of Mexico. Very nice man. We will be doing very much better with Mexico on trade deals.",
        "We're going to speed up the process, big league, because it's very inefficient. But they're on line and they're waiting to become citizens.",
        "Now we can talk about Putin. I don't know Putin. He said nice things about me. If we got along well, that would be good.",
        "No puppet. No puppet. You're the puppet. No, you're the puppet.",
        "She doesn't like Putin because Putin has outsmarted her at every step of the way.",
        "Look, she's been proven to be a liar on so many different ways. This is just another lie.",
        "We are going to start the engine rolling again, because right now, our country is dying at 1 percent GDP.",
        "Look, our country is stagnant. We've lost our jobs. We've lost our businesses. We're not making things anymore, relatively speaking.",
        "I say the one thing you have over me is experience, but it's bad experience, because what you've done has turned out badly.",
        "Nobody has more respect for women than I do. Nobody. Nobody has more respect.",
        "She mentions this, which is all fiction, all fictionalized, probably or possibly started by her and her very sleazy campaign. But I will tell you what isn't fictionalized are her e-mails.",
        "The other things are false, but honestly, I'd love to talk about getting rid of ISIS, and I'd love to talk about other things."
    ]
    
    static func getRandomString() -> String {
        let index = randomInt(low: 0, high: strings.count - 1)
        return strings[index]
    }
    
    static func randomInt(low: Int , high: Int) -> Int {
        return low + Int(arc4random_uniform(UInt32(high - low + 1)))
    }
    
}
