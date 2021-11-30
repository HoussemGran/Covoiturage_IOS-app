//
//  ViewController.swift
//  CarSharing
//
//  Created by Bouabid Wassim on 29/11/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.CustomBackgroundColor()
    }
    
    @IBAction func enterLogin(_ sender: Any) {
        let homeVc = LoginViewController()
        homeVc.modalPresentationStyle = .fullScreen
        self.present(homeVc, animated: true, completion: nil)
    }
}

