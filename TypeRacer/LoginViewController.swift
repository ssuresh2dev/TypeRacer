//
//  LoginViewController.swift
//  TypeRacer
//
//  Created by SAMEER SURESH on 10/20/16.
//  Copyright © 2016 trainingprogram. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didLogin(_ sender: AnyObject) {
        guard let emailText = email.text else { return }
        guard let passwordText = password.text else { return }
        FIRAuth.auth()?.signIn(withEmail: emailText, password: passwordText, completion: { (user, error) in
            if let error = error {
                print(error)
            } else {
                self.performSegue(withIdentifier: "toLanding", sender: self)
            }
        })
        
        /*
            Complete login for user using Firebase
            If login success, perform the "toLanding" segue
        */
    }

    @IBAction func didSignup(_ sender: AnyObject) {
        guard let emailText = email.text else { return }
        guard let passwordText = password.text else { return }
        FIRAuth.auth()?.createUser(withEmail: emailText, password: passwordText, completion: { (user, error) in
            if let error = error {
                print(error)
            } else {
                self.performSegue(withIdentifier: "toLanding", sender: self)
            }
        })
        /*
            Complete signup for user using Firebase
            If signup success, perform the "toLanding" segue
         */
    }

}
