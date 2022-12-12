//
//  ViewController.swift
//  ejerciciosClase6
//
//  Created by sebas  on 7/12/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    private struct Constant {
        static let expectedEmail = "sebas@hotmail.co"
        static let expectedPassword = "123"
        static let successValidationMessage = "Credenciales validas"
        static let failedValidationMessage = "Credenciales Invalidas"
        static let passwordEmailEmpty = "complete los campos"
        static let segueName = "navigateToTemperatureConverter"
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        processCredentials()
        presentEmail()
        presentPassword()
    }
    
    func processCredentials() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        let credentialsAreValid = validateCredentials(email: email, password: password) == navigateIfLoginSuccessful(email: email, password: password)
        processValidationResult(result: credentialsAreValid)
    }
    
    func validateCredentials(email: String, password: String) -> Bool {
        let condition = email == Constant.expectedEmail && password == Constant.expectedPassword
        if  condition {
            return true
        }else {
            return false
        }
    }
    
    func processValidationResult(result: Bool) {
        if result {
            resultLabel.text = Constant.successValidationMessage
        }else {
            resultLabel.text = Constant.failedValidationMessage
        }
        resultLabel.isHidden = false
    }
    
    func presentEmail() {
        let emailTextEmpty = emailTextField.text == ""
        if emailTextEmpty {
            resultLabel.text = Constant.passwordEmailEmpty
            emailTextField.backgroundColor = .red
        }else {
            emailTextField.backgroundColor = .systemBackground
        }
    }
    
    func presentPassword() {
        let passwordTextEmpty = passwordTextField.text == ""
        if passwordTextEmpty {
            resultLabel.text = Constant.passwordEmailEmpty
            passwordTextField.backgroundColor = .red
        }else {
            passwordTextField.backgroundColor = .systemBackground
        }
    }
    
    func navigateIfLoginSuccessful(email: String, password: String) -> Bool {
        let condition = email == Constant.expectedEmail && password == Constant.expectedPassword
        if  condition {
            performSegue(withIdentifier: Constant.segueName, sender: self)
            return true
        } else {
            return false
        }
    }
}


