//
//  LeaderboardViewController.swift
//  TypeRacer
//
//  Created by SAMEER SURESH on 10/20/16.
//  Copyright © 2016 trainingprogram. All rights reserved.
//

import Firebase
import UIKit

class LeaderboardViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var currentUser: CurrentUser?
    var games: [Game] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        if let currentUser = currentUser {
            for id in currentUser.completedGameIds {
                GameAPI.getGameFromId(id: id, block: { (game) in
                    if let game = game {
                        DispatchQueue.main.async {
                            self.games.append(game)
                            self.tableView.insertRows(at: [IndexPath(item: self.games.count - 1, section: 0)], with: .none)
                        }
                    }
                })
                /*
 
                    Use GameAPI.getGameFromId to create a game object for each id
                    Once we retrieve the game, add this to our list of games and insert into the tableview at indexpath corresponding to the last index of games and section 0
                    
                    Remember to use GCD for this!
 
                */
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension LeaderboardViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count // Change this!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Initialize LeaderboardTableViewCell and set up UI using awakeFromNib
//        return UITableViewCell() // Delete this!
        let cell = UITableViewCell()
        cell.textLabel?.text = games[indexPath.row].correctString
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        /* set data within tableviewcells */
    }
    
}

class LeaderboardTableViewCell: UITableViewCell {
    
    var wpmLabel: UILabel!
    var accuracyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        /*
            Set up tableview cell with these two labels
 
        */
    }
    
    
}
