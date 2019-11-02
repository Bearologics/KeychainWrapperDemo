//
//  ViewController.swift
//  KeychainWrapperDemo
//
//  Created by Marcus Kida on 02.11.19.
//  Copyright © 2019 Bearologics UG (haftungsbeschränkt). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var serviceTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    private let keychainWrapper = KeychainWrapper(service: "myApp")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func getTapped(_ sender: UIButton) {
        guard let username = usernameTextField.text, username.count > 0 else {
            resultLabel.text = "Please enter username"
            return
        }
        if let password = keychainWrapper[username] {
            passwordTextField.text = password
        } else {
            resultLabel.text = "Password not found"
        }
    }

    @IBAction private func createOrUpdateTapped(_ sender: UIButton) {
        guard let username = usernameTextField.text, username.count > 0 else {
            resultLabel.text = "Please enter username"
            return
        }
        guard let password = passwordTextField.text, password.count > 0 else {
            resultLabel.text = "Please enter password"
            return
        }
        keychainWrapper[username] = password
        resultLabel.text = "Password created/updated successfully"
    }

    @IBAction private func deleteTapped(_ sender: UIButton) {
        guard let username = usernameTextField.text else {
            resultLabel.text = "Please enter username"
            return
        }
        if keychainWrapper.del(valueForKey: username) {
            resultLabel.text = "Password deleted successfully"
        } else {
            resultLabel.text = "Could not delete password. Not existing?"
        }
        
    }
}

