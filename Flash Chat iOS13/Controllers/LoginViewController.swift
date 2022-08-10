//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var authManager = AuthManager() as AuthLogin
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authManager.delegate = self
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            authManager.signIn(withEmail: email, password: password)
        }
    }
}

extension LoginViewController: AuthManagerDelegate {
    func didFailWithError(error: Error) {
        print(error)
    }
    
    func didSuccessRequest(authManager: AuthManager) {
        self.performSegue(withIdentifier: K.loginSegue, sender: self)
    }
}
