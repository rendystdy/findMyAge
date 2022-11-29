//
//  ViewController.swift
//  Find My Age
//
//  Created by Rendy Setiadi on 27/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateMyAge(_ sender: Any) {
        let birthDate = self.datePicker.date
        
        let today = Date()
        
        if birthDate >= today {
            let alertController = UIAlertController(title: "Error", message: "Please enter a valid date", preferredStyle: .alert)
            let alerAction = UIAlertAction(title: "yes", style: .default, handler: nil)
            alertController.addAction(alerAction)
            self.present(alertController, animated: true, completion: nil)
            return
        }
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year,.month,.day], from: birthDate, to: today)
        
        guard let ageYears = components.year else {return}
        guard let ageMonth = components.month  else {return}
        guard let ageDay = components.day else {return}
        
        self.ageLabel.text = "\(ageYears) years, \(ageMonth) month, \(ageDay) day"
    }
    
}

