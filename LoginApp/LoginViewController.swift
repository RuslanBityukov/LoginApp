//
//  ViewController.swift
//  LoginApp
//
//  Created by Руслан Битюков on 26.10.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let login = "Login"
    private let password = "Password"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? WelcomeViewController else { return }
        settingVC.name = login
    }

    @IBAction func loginTapButton() {
        if userNameTextField.text != login || passwordTextField.text != password {
            showAlert(with: "Invalid login or password", and: "Please, enter correct login and password")
        }
    }
    
    @IBAction func forgotUserNameButton() {
        showAlert(with: "Oppps 🤔", and: "You login - Login")
    }
    
    @IBAction func forgotPasswordButton() {
        showAlert(with: "Oppps 🤔", and: "You password - Password")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        passwordTextField.text = ""
    }
}

// MARK: Setting alert
extension LoginViewController {
    
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
    
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: Setting touches began

extension LoginViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            loginTapButton()
            performSegue(withIdentifier: "segue", sender: nil)
        }
        return true
    }
}
