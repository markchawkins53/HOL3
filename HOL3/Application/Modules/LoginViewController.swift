//
//  LoginViewController.swift
//  HOL3
//
//  Created by Mark Hawkins on 2/9/20.
//  Copyright © 2020 Revature. All rights reserved.
//

import UIKit

class LoginViewController : UIViewController {
    let userLogin = UserLogin()
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Button to call function that will authenticate user
    @IBAction func authorizeUser() {
        //check to see if user is authorized
        if userLogin.authorizeUser(emailAddress: email.text!, password: pass.text!) {
            //if authorized, instantiate new storyboard
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let controller: UIViewController = storyboard.instantiateViewController(identifier: "Home")
            
            //load new storyboard
            self.present(controller, animated: true, completion: nil)
            
            return
        }
        
        showAlert("Error", "Invalid Combination")
    }
    
    func showAlert (_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
