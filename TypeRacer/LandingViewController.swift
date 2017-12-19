//
//  LandingViewController.swift
//  TypeRacer
//
//  Created by SAMEER SURESH on 10/20/16.
//  Copyright © 2016 trainingprogram. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
    
    let currentUser = CurrentUser()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didSelectLeaderboard(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "toLeaderboard", sender: self)
    }
    @IBAction func didSelectNewGame(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "toGame", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toLeaderboard" {
            let vc = segue.destination as! LeaderboardViewController
            vc.currentUser = currentUser
        } else {
            let vc = segue.destination as! GameViewController
            vc.currentUser = currentUser
        }
    }

}
