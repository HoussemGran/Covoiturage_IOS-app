//
//  LoginViewController.swift
//  CarSharing
//
//  Created by Bouabid Wassim on 29/11/2021.
//

import UIKit
import Loaf

class LoginViewController: UIViewController {

    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var eyeButton: UIButton!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    /** show or hide text content      */
    @IBAction func showOrHideText(_ sender: UIButton) {
        self.password.isSecureTextEntry = !self.password.isSecureTextEntry
        self.eyeButton.isSelected = !self.eyeButton.isSelected
    }
    @IBAction func LogIn(_ sender: Any) {
        if Email.text?.isValidEmail() == true {
        let homeVc: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let startingView = homeVc.instantiateInitialViewController()
        startingView?.modalPresentationStyle = .fullScreen
        self.present(startingView!, animated: true, completion: nil)
        } else {
            Loaf(
                "Please Verify Your Email",
                state: .custom(
                    .init(
                        backgroundColor: UIColor.gray,
                        textColor: .black,
                        icon: nil,
                        textAlignment: .center
                        )
                ),
                sender: self
            ).show()
        
        }
    }
}


extension LoginViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let maxLength = 10
            let currentString: NSString = (textField.text ?? "") as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length >= maxLength
        }
}

    
extension String {
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}
