//
//  SignUpViewController.swift
//  AthenaHacks
//
//  Created by Sarah Gemperle on 2/24/18.
//  Copyright © 2018 Allison Reiss. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPassTextField: UITextField!
    
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
  
    @IBAction func onSignUpPress(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if(error != nil) {
                print(error)
            } else {
                print("Yay sign up worked!")
            }
        }
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
