//
//  AddTripViewController.swift
//  CarSharing
//
//  Created by Bouabid Wassim on 30/11/2021.
//

import UIKit
import iOSDropDown
import Loaf

class AddTripViewController: UIViewController {
    
    @IBOutlet weak var sourceTrip: DropDown!
    @IBOutlet weak var destinationTrip: DropDown!
    @IBOutlet weak var placeNumbers: DropDown!
    @IBOutlet weak var timePicker: UIPickerView!
    
    /// Check all possible places to trip for
    let placesArray = ["Sahloul","Epi","Proxym","Riyath"]
    
    /// Possible Place Numbers for a trip
    let placeNumbersArray = ["1","2","3","4","5","6"]
    
    /// Save time propprties
    var timeString = ""
    
    // Hour manager
    var hour: Int = 0
    
    // Minute manager
    var minute: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // The list of array to display. Can be changed dynamically
        self.editDropDowns()
        timePicker.delegate = self
        timePicker.dataSource = self
        
    }
    @IBAction func comfirmAddition(_ sender: Any) {

        if self.sourceTrip.text?.isEmpty == true {
            Loaf(
                "Empty source Trip field, please fill it!",
                state: .custom(
                    .init(
                        backgroundColor: UIColor.red,
                        textColor: .black,
                        icon: nil,
                        textAlignment: .center
                        )
                ),
                sender: self
            ).show()
        }
        else if self.destinationTrip.text?.isEmpty == true {
            Loaf(
                "Empty destination Trip field, please fill it!",
                state: .custom(
                    .init(
                        backgroundColor: UIColor.red,
                        textColor: .black,
                        icon: nil,
                        textAlignment: .center
                        )
                ),
                sender: self
            ).show()
        }
        
        else if self.destinationTrip.text?.isEmpty == true {
            Loaf(
                "Empty placeNumbers field, please fill it!",
                state: .custom(
                    .init(
                        backgroundColor: UIColor.red,
                        textColor: .black,
                        icon: nil,
                        textAlignment: .center
                        )
                ),
                sender: self
            ).show()
        }
        
        else if self.sourceTrip.text == self.destinationTrip.text  {
            Loaf(
                "Same source and Destination fields, please modify one at least!",
                state: .custom(
                    .init(
                        backgroundColor: UIColor.red,
                        textColor: .black,
                        icon: nil,
                        textAlignment: .center
                        )
                ),
                sender: self
            ).show()
        }
}
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
        {
        self.view.endEditing(true)
            return true;
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func editDropDowns() {
        sourceTrip.optionArray = self.placesArray
       
        // The the Closure returns Selected Index and String
        sourceTrip.didSelect{(selectedText , index ,id) in
        self.sourceTrip.text = "Selected String: \(selectedText) \n index: \(index)"
        }
        self.destinationTrip.optionArray = self.placesArray
        // The the Closure returns Selected Index and String
        self.destinationTrip.didSelect{(selectedText , index ,id) in
        self.destinationTrip.text = "Selected String: \(selectedText) \n index: \(index)"
        }
            
        self.placeNumbers.optionArray = self.placeNumbersArray
               
        // The the Closure returns Selected Index and String
        self.placeNumbers.didSelect{(selectedText , index ,id) in
        self.placeNumbers.text = "Selected String: \(selectedText) \n index: \(index)"
        }
         
    }
}
    
extension AddTripViewController: UIPickerViewDelegate, UIPickerViewDataSource{

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 24
        } else {
        return 60
            }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(format: "%02d", row)
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
             hour = row
            print("hour: \(hour)")
        }else{
             minute = row
            print("minute: \(minute)")
        }
        self.timeString = "\(hour) : \(minute)"
        }
}

