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

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var confirmPassTextField: UITextField!
    
    var user: AnyObject?
    
    var handle: AuthStateDidChangeListenerHandle?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func onSignUpPress(_ sender: Any) {
        Auth.auth().createUser(withEmail: usernameTextField.text!, password: passTextField.text!) { (user, error) in
            if(error != nil) {
                print(error?.localizedDescription)
            } else {
                self.user = user
                self.performSegue(withIdentifier: "toCategorySegue", sender: self)
                print("Yay sign up worked!")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! CharityViewController
        
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
