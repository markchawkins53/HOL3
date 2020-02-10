//
//  UserLogin.swift
//  HOL3
//
//  Created by Mark Hawkins on 2/9/20.
//  Copyright © 2020 Revature. All rights reserved.
//

import Foundation

class UserLogin {
    
    //Adds a new user to the Users.plist file
    func addUser(emailAddress email: String, password pass: String) {
        var userDictionary: NSMutableDictionary?
        
        //Get path to the file in bundle (Not using file manager and meant to
        //only have information kept in the current session
        if let path = Bundle.main.path(forResource: "Users", ofType: "plist") {
            //Get a the Dictionary from the plist and make is mutable
            userDictionary = NSMutableDictionary(contentsOfFile: path)
            
            //Add a new value to the dictionary
            userDictionary?.setValue(pass, forKey: email)
            
            //Write the updated dictionary to the Users.plist
            try? userDictionary?.write(to: Bundle.main.bundleURL.appendingPathComponent("Users.plist"))
        }
    }
    
    //Check to make sure that the email being used is valid
    func isEmailValid (emailAddress email: String) -> Bool {
        //Regex setup
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        //Check to see if the email address is properly formatted and is not currently
        //used in the User.plist
        if emailTest.evaluate(with: email) &&
            getUserDictionary()?.object(forKey: email) == nil {
            return true
        }
        
        return false
    }
    
    func authorizeUser(emailAddress email: String, password pass: String) -> Bool {
        if let userDictionary = getUserDictionary(), let value: String = userDictionary.value(forKey: email) as? String {
            
            if value == pass {
                return true
            }
            
        }
        
        return false;
    }
    
    //Get the User.plist dictionary
    func getUserDictionary() -> NSDictionary? {
        if let path = Bundle.main.path(forResource: "Users", ofType: "plist") {
            return NSDictionary(contentsOfFile: path)
        }
        
        return nil
    }
    
}
