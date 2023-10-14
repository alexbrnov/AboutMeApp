//
//  ProfileViewController.swift
//  AboutMeApp
//
//  Created by Alexandr Baranov on 11.10.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet var profileImage: UIImageView! {
        didSet {
            profileImage.layer.cornerRadius = profileImage.frame.height / 2
        }
    }
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var companyLabel: UILabel!
    @IBOutlet var positionLabel: UILabel!
    @IBOutlet var hobbyLabel: UILabel!
    
    // MARK: - Public Properties
    var user: User!
    
    // MARK: - Overrides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = user.personalInfo.firstname

        profileImage.image = UIImage(named: user.photo)
        nameLabel.text = user.personalInfo.getFullName
        ageLabel.text = String(user.personalInfo.age)
        companyLabel.text = user.personalInfo.company
        positionLabel.text = user.personalInfo.position
        hobbyLabel.text = user.personalInfo.hobby
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let bioVC = segue.destination as? BioViewController
        bioVC?.user = user
    }
}
