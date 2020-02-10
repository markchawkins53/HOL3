//
//  SignupViewController.swift
//  HOL3
//
//  Created by Mark Hawkins on 2/9/20.
//  Copyright © 2020 Revature. All rights reserved.
//

import UIKit

let userLogin = UserLogin()

class SignupViewController : UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var retypePassText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Function called by signup button to add user to system
    @IBAction func signupUser () {
        //If the user email is not properly formatted and the email is taken,
        //the user will not be added to the system.
        if !userLogin.isEmailValid(emailAddress: emailText.text!) {
            showAlert("Error", "The format is invalid")
            return
        }
        
        //Check if the user typed in the correct password twice
        if passText.text! != retypePassText.text! {
            showAlert("Error", "Passwords do not match")
            return
        }
        
        //Add new user to the system
        userLogin.addUser(emailAddress: emailText.text!, password: passText.text!)
        
        showAlert("Success", "User Added")
    }
    
    func showAlert (_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
