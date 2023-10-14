//
//  BioViewController.swift
//  AboutMeApp
//
//  Created by Alexandr Baranov on 11.10.2023.
//

import UIKit

final class BioViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet var bioLabel: UILabel!
    
    //MARK: - Public Properties
    var user: User!
    
    // MARK: - Overrides Methods
       override func viewDidLoad() {
           super.viewDidLoad()
           bioLabel.text = user.personalInfo.bio
       }
}
