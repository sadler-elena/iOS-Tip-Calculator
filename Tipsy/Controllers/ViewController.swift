//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    var tipCalculator = TipCalculatorBrain()
    

    @IBOutlet weak var billTextField:
        UITextField!
    
    @IBOutlet weak var zeroPctButton:
        UIButton!
    
    @IBOutlet weak var tenPctButton:
        UIButton!
    
    @IBOutlet weak var twentyPctButton:
        UIButton!
    
    @IBOutlet weak var splitNumberLabel:
        UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Initialize default tip divide value to 1.
        tipCalculator.splitTotalByNumber = 1.0
    }
    
    @IBAction func tipPctChanged(_ sender: UIButton) {
        //Change the button value to selected based off sender.

        switch sender.tag {
        //0%
        case 0:
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tipCalculator.tipPercentage = 0.00
        //10%
        case 1:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tipCalculator.tipPercentage = 0.10
        //20%
        case 2:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            tipCalculator.tipPercentage = 0.20
        default:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tipCalculator.tipPercentage = 0.10
        }
        
        
        
    }
    
    @IBAction func splitValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        tipCalculator.splitTotalByNumber = sender.value
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        tipCalculator.billTotalString = billTextField.text!
        tipCalculator.totalFloat = Float(tipCalculator.billTotalString!)!
        tipCalculator.totalPerPerson = tipCalculator.calculateTotal(billTotal: tipCalculator.totalFloat, tipPercentage: tipCalculator.tipPercentage, splitTotalByNumber: tipCalculator.splitTotalByNumber)
        self.performSegue(withIdentifier: "goToCalculate", sender: self)
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToCalculate" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.splitTotal = tipCalculator.totalPerPerson
            destinationVC.splitByInt = tipCalculator.splitTotalByNumber
            destinationVC.tipPercent = tipCalculator.tipPercentage
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
}

