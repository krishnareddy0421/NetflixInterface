//
//  SignupVC.swift
//  NetflixInterface
//
//  Created by vamsi krishna reddy kamjula on 10/14/17.
//  Copyright © 2017 kvkr. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var confPasswordTxt: UITextField!
    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        activitySpinner.isHidden = true
    }
    
    func setupView() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    @IBAction func createBtnPressed(_ sender: Any) {
        guard let email = emailTxt.text, let password = passwordTxt.text, let confPassword = confPasswordTxt.text, emailTxt.text != "", passwordTxt.text != "", confPasswordTxt.text != "", password == confPassword else {
            self.userCredentialsAlert()
            return
        }
        activitySpinner.isHidden = false
        activitySpinner.startAnimating()
        AuthService.instance.createUser(userEmail: email, userPassword: password) { (success) in
            if success {
                self.handleSpinnerAnimation()
                self.performSegue(withIdentifier: TO_HOME_SEGUE, sender: nil)
            } else {
                self.handleSpinnerAnimation()
                self.userEmailWrongAlert()
            }
        }
    }
    
    func handleSpinnerAnimation() {
        activitySpinner.isHidden = true
        activitySpinner.stopAnimating()
        view.endEditing(true)
    }
    
    @IBAction func cancelBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
