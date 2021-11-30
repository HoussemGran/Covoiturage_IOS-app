//
//  TravelViewController.swift
//  CarSharing
//
//  Created by Bouabid Wassim on 29/11/2021.
//

import UIKit

class TravelViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, YesNoPoupupViewControllerDelegate {
 

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(
            UINib(
                nibName: TravelCell.identifier,
                bundle: nil
            ),
            forCellReuseIdentifier: TravelCell.identifier
        )
        
    }
    
    
    func didPressYes() {
        print("accepted")
    }

    
    @objc func join(sender: UIButton) {
        let yesNoPopuoController = YesNoPoupupViewController()
            yesNoPopuoController.delegate = self
            yesNoPopuoController.modalPresentationStyle = .overCurrentContext
            yesNoPopuoController.modalTransitionStyle = .crossDissolve
            self.present(yesNoPopuoController , animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let travelCell = self.tableView.dequeueReusableCell(
            withIdentifier: TravelCell.identifier) as! TravelCell
        travelCell.JoinButton.addTarget(self, action: #selector(join(sender:)), for: .touchUpInside)
        return  travelCell
    }
 
}
