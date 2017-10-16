//
//  ViewController.swift
//  NetflixInterface
//
//  Created by vamsi krishna reddy kamjula on 10/14/17.
//  Copyright © 2017 kvkr. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
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
    
    override func viewWillAppear(_ animated: Bool) {
        emailTxt.text = ""
        passwordTxt.text = ""
    }

    @IBAction func loginBtnPressed(_ sender: Any) {
        guard let email = emailTxt.text, let password = passwordTxt.text, emailTxt.text != "", passwordTxt.text != "" else {
            self.userCredentialsAlert()
            return
        }
        activitySpinner.isHidden = false
        activitySpinner.startAnimating()
        AuthService.instance.login(userEmail: email, userPassword: password, completion: { (success) in
            if success {
                self.handleSpinnerAnimation()
                self.performSegue(withIdentifier: TO_HOME_SEGUE, sender: nil)
            } else {
                self.handleSpinnerAnimation()
                self.userEmailWrongAlert()
            }
        })
    }
    
    func handleSpinnerAnimation() {
        activitySpinner.isHidden = true
        activitySpinner.stopAnimating()
        view.endEditing(true)
    }
    
    @IBAction func signupBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_SIGNUP_SEGUE, sender: nil)
    }
    
}

