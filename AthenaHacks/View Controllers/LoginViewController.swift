//
//  LoginViewController.swift
//  AthenaHacks
//
//  Created by Allison Reiss on 2/24/18.
//  Copyright © 2018 Allison Reiss. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuthUI

class LoginViewController: UIViewController {
    
    var handle: AuthStateDidChangeListenerHandle?

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    
    @IBAction func onSignIn(_ sender: Any) {
        Auth.auth().signIn(withEmail: username.text!, password: password.text!) { (user, error) in
            if let user = user {
                let uid = user.uid
                let email = user.email
                print(uid)
            }
            if(user != nil) {
                print("yay create user worked")
                
            } else {
                print("rip")
            }
            if let error = error {
                print(error)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            // ...
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }

   

}
