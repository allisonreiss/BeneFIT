//
//  SignUpViewController.swift
//  AthenaHacks
//
//  Created by Sarah Gemperle on 2/25/18.
//  Copyright © 2018 Allison Reiss. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    var handle: AuthStateDidChangeListenerHandle?
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var confirmPassTextField: UITextField!
    
    var handle: AuthStateDidChangeListenerHandle?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onSignUpPress(_ sender: Any) {
        Auth.auth().createUser(withEmail: usernameTextField.text!, password: passTextField.text!) { (user, error) in
            if(error != nil) {
                print(error)
            } else {
                print("Yay sign up worked!")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
