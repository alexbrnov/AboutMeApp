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
    
    var user: String!
    
    // MARK: - Overrides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingLabel.text = "Hello, \(user ?? "")!"

       
    }
    

    // MARK: - IB Actions
    
    
    
    // MARK: - Public Methods
    
    // MARK: - Private Methods
}
