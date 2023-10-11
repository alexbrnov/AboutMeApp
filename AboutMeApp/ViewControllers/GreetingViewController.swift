//
//  GreetingViewController.swift
//  AboutMeApp
//
//  Created by Alexandr Baranov on 06.10.2023.
//

import UIKit

final class GreetingViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet var greetingLabel: UILabel!
    
    // MARK: - Public Properties
    var user: User!
    
    // MARK: - Private Properties
    private let firstBgColor = UIColor(red: 0.514, green: 0.643, blue: 0.831, alpha: 1)
    private let secondBgColor = UIColor(red: 0.714, green: 0.984, blue: 1, alpha: 1)
    
    // MARK: - Overrides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingLabel.text = "Hello, \(user.username)!"
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [firstBgColor.cgColor, secondBgColor.cgColor]
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

