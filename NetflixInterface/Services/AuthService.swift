//
//  AuthService.swift
//  NetflixInterface
//
//  Created by vamsi krishna reddy kamjula on 10/15/17.
//  Copyright © 2017 kvkr. All rights reserved.
//

import UIKit
import FirebaseAuth

class AuthService {
    static let instance = AuthService()
    
    func createUser(userEmail: String, userPassword: String, completion: @escaping CompletionHandler) {
        Auth.auth().createUser(withEmail: userEmail, password: userPassword) { (user, error) in
            if error != nil {
                // error handling
                completion(false)
                print(error!.localizedDescription)
                return
            }
            completion(true)
        }
    }
    
    func login(userEmail: String, userPassword: String, completion: @escaping CompletionHandler) {
        Auth.auth().signIn(withEmail: userEmail, password: userPassword) { (user, error) in
            if error != nil {
                completion(false)
                print(error!.localizedDescription)
                return
            }
            completion(true)
        }
    }
}
