//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Elena Sadler on 10/28/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var splitTotal: Float?
    var splitByInt: Double?
    var tipPercent: Float?
    @IBOutlet weak var totalLabel:
        UILabel!
    
    @IBOutlet weak var settingsLabel:
        UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        totalLabel.text = "$ " + String(format: "%.2f", splitTotal!)
        
        if splitByInt! > 1.0 {
            settingsLabel.text = "This is the total per person split between " + String(format: "%.0f", splitByInt!) +  " people with a " + String(tipPercent! * 100.0) + "% tip."
        }
        if splitByInt! <= 1.0 {
            settingsLabel.text = "This is the total with a " + String(tipPercent! * 100.0) + "% tip."
        }
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func recalulatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
