//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var authManager = AuthManager() as AuthRegister
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authManager.delegate = self
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            authManager.createUser(withEmail: email, password: password)
        }
    }
    
}

// MARK: - AuthManagerDelegate
extension RegisterViewController: AuthManagerDelegate {
    func didFailWithError(error: Error) {
        print(error)
    }
    
    func didSuccessRequest(authManager: AuthManager) {
        self.performSegue(withIdentifier: K.registerSegue, sender: self)
    }
}
