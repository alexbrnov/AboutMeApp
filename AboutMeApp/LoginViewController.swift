//
//  LoginViewController.swift
//  AboutMeApp
//
//  Created by Alexandr Baranov on 06.10.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let user = "user"
    private let pass = "pass"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          super.touchesBegan(touches, with: event)
          view.endEditing(true)
      }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameTextField.text == user, passwordTextField.text == pass else {
            showAlert(
                withTitle: "Wrong login or pass",
                andMessage: "Please enter correct values"
            )
            return false
        }
        
        return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let greetingVC = segue.destination as? GreetingViewController else { return }
        greetingVC.user = userNameTextField.text
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func forgotUsernameButtonTapped() {
        showAlert(
            withTitle: "Oops",
            andMessage: "Try \(user)"
        )
    }
    
    @IBAction func forgotPassButtonTapped() {
        showAlert(
            withTitle: "Oops",
            andMessage: "Try \(pass)"
        )
    }
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.userNameTextField.text = ""
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
