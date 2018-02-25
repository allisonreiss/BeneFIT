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
    @IBOutlet weak var signUpButton: UIButton!
    
    var user: AnyObject?
    
    var handle: AuthStateDidChangeListenerHandle?
    var gradient : CAGradientLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpButton.layer.cornerRadius = 15
        signUpButton.clipsToBounds = true
        
        // Set up the background gradient
        gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        let colorTop = UIColor(red: 166.0 / 255.0, green: 237.0 / 255.0, blue: 233.0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 69.0 / 255.0, green: 247.0 / 255.0, blue: 146.0 / 255.0, alpha: 1.0).cgColor
        gradient.colors = [colorTop, colorBottom]
        gradient.zPosition = -1
        self.view.layer.addSublayer(gradient)
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
