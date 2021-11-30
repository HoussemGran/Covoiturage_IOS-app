//
//  WelcomeViewController.swift
//  CarSharing
//
//  Created by Bouabid Wassim on 29/11/2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.CustomBackgroundColor()
        // Do any additional setup after loading the view.
    }

    @IBAction func enterLogin(_ sender: Any) {
        let homeVc = LoginViewController()
        homeVc.modalPresentationStyle = .fullScreen
        self.present(homeVc, animated: true, completion: nil)
    }
    
}
