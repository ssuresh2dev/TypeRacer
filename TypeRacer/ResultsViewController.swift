//
//  ResultsViewController.swift
//  TypeRacer
//
//  Created by SAMEER SURESH on 10/20/16.
//  Copyright © 2016 trainingprogram. All rights reserved.
//

import UIKit
import Firebase

class ResultsViewController: UIViewController {

    @IBOutlet weak var wpmLabel: UILabel!
    @IBOutlet weak var accuracyLabel: UILabel!
    
    var wpm: Double?
    var accuracy: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wpmLabel.text = "\(wpm!)"
        accuracyLabel.text = String(format: "%.2f", accuracy!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didEnd(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
