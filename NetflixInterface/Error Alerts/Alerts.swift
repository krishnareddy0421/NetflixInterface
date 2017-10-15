//
//  Alerts.swift
//  NetflixInterface
//
//  Created by vamsi krishna reddy kamjula on 10/15/17.
//  Copyright © 2017 kvkr. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func userCredentialsAlert() {
        let alert = UIAlertController.init(title: "Enter your email/password", message: "try again !!!", preferredStyle: .alert)
        let cancelAction = UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func userEmailWrongAlert() {
        let alert = UIAlertController.init(title: "Wrong useremail/password", message: "something went wrong, try again !!!", preferredStyle: .alert)
        let cancelAction = UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func somethingWentWrongAlert() {
        let alert = UIAlertController.init(title: "Something Wrong", message: "Please, try again !!!", preferredStyle: .alert)
        let cancelAction = UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
}
