//
//  GameViewController.swift
//  TypeRacer
//
//  Created by SAMEER SURESH on 10/20/16.
//  Copyright © 2016 trainingprogram. All rights reserved.
//

import UIKit
import Firebase
import SwiftyLevenshtein

class GameViewController: UIViewController {

    
    @IBOutlet weak var correctStringLabel: UILabel!
    @IBOutlet weak var inputField: UITextField!
    
    var correctString: String!
    var currentUser: CurrentUser?
    var elapsedTime: Double!
    
    var wpm: Double!
    var accuracy: Double!
    var didFinish: Bool = false
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        correctString = StringGenerator.getRandomString()
        correctStringLabel.text = correctString
        
        // Start a timer now! This should stop when the user hits the submit button.
        elapsedTime = 0.0
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(didTimeChange), userInfo: nil, repeats: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if didFinish {
             navigationController?.popToRootViewController(animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func didTimeChange() {
        elapsedTime = elapsedTime + 0.1
    }
    
    // TODO:
    @IBAction func didSubmit(_ sender: AnyObject) {
        guard let inputText = inputField.text else { return }
        timer.invalidate()
        
        /* Calculate the WPM and accuracy
            We can calculate words per minute as follows:
                Use the helper function to calculate the number of words in the original string.
                Calculate the total number of minutes elapsed (we store elapsedTime in seconds)
                Divide words by minutes to get wpm
            
            We can calculate accuracy by calling the below helper function on inputText
         
            Once we calculate these, use the currentUser variable (stored as class variable above) to add this new game to our database.
         */
        
        
        accuracy = calculateAccuracy(userInput: inputText)
        let words = Double(calculateNumberOfWordsInString(string: correctString))
        let minutes = elapsedTime / 60
        wpm = (words / minutes)
        
        
         currentUser!.addNewGame(wpm: wpm, accuracy: accuracy, correct: correctString, input: inputText)
        self.performSegue(withIdentifier: "toResults", sender: self)
        
    }
    
    func calculateNumberOfWordsInString(string: String) -> Int {
        return string.components(separatedBy: " ").count
    }
    
    func calculateAccuracy(userInput: String) -> Double {
        // Use this function to calculate the accuracy
        let distance = levenshtein(sourceString: userInput, target: correctString)
        let length = correctString.characters.count
        return Double(length - distance) / Double(length)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResults" {
            didFinish = true
            let vc = segue.destination as! ResultsViewController
            vc.wpm = wpm
            vc.accuracy = accuracy
        }
    }
}
