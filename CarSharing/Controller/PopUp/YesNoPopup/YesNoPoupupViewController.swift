//
//  YesNoPoupupViewController.swift
//  Makan
//
//  Created by Wassim Bouabid on 18/04/2021.
//  Copyright © 2021 Karizma. All rights reserved.
//

import UIKit


protocol YesNoPoupupViewControllerDelegate {
    
    func didPressYes()
}


final class YesNoPoupupViewController: UIViewController, UIGestureRecognizerDelegate {
    
    /// YesNoPopup identifer
    static let identifier = "YesNoPoupupViewController"
    
    @IBOutlet weak private var holderView: UIView!
    @IBOutlet weak private var popupView: UIView!
    @IBOutlet weak private var titleView: UIView!
    @IBOutlet weak private var messageView: UIView!
    @IBOutlet weak private var stackView: UIStackView!
    @IBOutlet weak private var closeView: UIView!
    @IBOutlet weak private var buttonsView: UIStackView!
    @IBOutlet weak private var yesButton: UIButton!
    @IBOutlet weak private var noButton: UIButton!
    
    /// Yes no delegate
    var delegate: YesNoPoupupViewControllerDelegate!
    
    
    
    /// Tiltle cahnged in the present process
    var locationTitle: String?
    
    /// Alert informating title
    var alertInfoTitle: String?
    
    /// Modifie yes click text
    var yesText: String?
        
    /// Modifie no click text
    var noText: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.outsideTapRecognizer()
    }
    
    
    /* Provide a tap recognizer instance */
    func outsideTapRecognizer() {
    let outsideTap = UITapGestureRecognizer(
     target: self,
     action: #selector(self.outsideTap(_:))
    )
    outsideTap.delegate = self
    self.view.addGestureRecognizer(outsideTap)
    }
    
    
    /* Ignore rating app for an outside view tap */
    @objc func outsideTap(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /* YesNoPoupupView initializer */
    init () {
        super.init(nibName: YesNoPoupupViewController.identifier, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @IBAction private func yesAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        self.delegate.didPressYes()
    }
    
    
    @IBAction private func noAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return !self.holderView.bounds.contains(touch.location(in: self.holderView))
    }

}
