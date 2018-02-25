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
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    var gradient : CAGradientLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up the background gradient
        gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [UIColor.purple.cgColor, UIColor.blue.cgColor]
        gradient.zPosition = -1
        usernameField.layer.zPosition = 2
        passwordField.layer.zPosition = 2
        self.view.layer.addSublayer(gradient)
        
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        Auth.auth().signIn(withEmail: usernameField.text!, password: passwordField.text!) { (user, error) in
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
