//
//  WelcomViewController.swift
//  LoginApp
//
//  Created by Руслан Битюков on 26.10.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var name: String! 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome, \(name ?? "User")"
    }
}
