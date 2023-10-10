//
//  LoginViewController.swift
//  AboutMeApp
//
//  Created by Alexandr Baranov on 06.10.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Private properties
    private let user = "user"
    private let pass = "pass"
    
    // MARK: - Overrides methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameTextField.text == user, passwordTextField.text == pass else {
            showAlert(
                withTitle: "Wrong login or pass",
                andMessage: "Please enter correct values",
                textField: passwordTextField
            )
            return false
        }
        return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let greetingVC = segue.destination as? GreetingViewController else { return }
        greetingVC.user = user
    }
    
    // MARK: - IB Actions
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        passwordTextField.text = ""
    }
    
    @IBAction func helpButtonTapped(_ sender: UIButton) {
        if sender.tag == 1 {
            showAlert(withTitle: "Oops",andMessage: "Try \(user)")
        } else {
            showAlert(withTitle: "Oops", andMessage: "Try \(pass)")
        }
    }
    
    // MARK: - Private methods
    private func showAlert(withTitle title: String, andMessage message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

