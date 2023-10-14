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
    private let user = User.getInfo()
    
    // MARK: - Overrides methods
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.text = user.username
        passwordTextField.text = user.password
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameTextField.text == user.username, passwordTextField.text == user.password else {
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
        let tabBarController = segue.destination as? UITabBarController
        tabBarController?.viewControllers?.forEach { viewController in
            if let greetingVC = viewController as? GreetingViewController {
                greetingVC.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                let profileVC = navigationVC.topViewController
                guard let profileVC = profileVC as? ProfileViewController else { return }
                profileVC.user = user
            }
        }
    }
    
    // MARK: - IB Actions
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        passwordTextField.text = user.password
        userNameTextField .text = user.username
        
    }
    
    @IBAction func helpButtonTapped(_ sender: UIButton) {
        if sender.tag == 1 {
            showAlert(withTitle: "Oops",andMessage: "Try \(user.username)")
        } else {
            showAlert(withTitle: "Oops", andMessage: "Try \(user.password)")
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

