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
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    var gradient : CAGradientLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up the background gradient
        gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        let colorTop = UIColor(red: 166.0 / 255.0, green: 237.0 / 255.0, blue: 233.0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 69.0 / 255.0, green: 247.0 / 255.0, blue: 146.0 / 255.0, alpha: 1.0).cgColor
        gradient.colors = [colorTop, colorBottom]
        gradient.zPosition = -1
        self.view.layer.addSublayer(gradient)
        
        signUpButton.layer.cornerRadius = 15
        signUpButton.clipsToBounds = true
        signInButton.layer.cornerRadius = 15
        signInButton.clipsToBounds = true
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destination = 
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
