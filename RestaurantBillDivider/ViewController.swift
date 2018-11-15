//
//  ViewController.swift
//  RestaurantBillDivider
//
//  Created by Gus Person on 11/14/18.
//  Copyright © 2018 Gus Person. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    
    //MARK:  Properties

    @IBOutlet var mealPrice: UITextField!

    @IBOutlet var tenPercentTip: UILabel!
    @IBOutlet var fifteenPercentTip: UILabel!
    
    @IBOutlet var twentyPercentTip: UILabel!
    
    @IBOutlet var taxTotal: UILabel!
    
    
    @IBOutlet var finalBillAmount: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.mealPrice.delegate = self;
    }

    //MARK:  UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealPrice.text = textField.text
    }


    //MARK:  Actions
    
    @IBAction func calculatePricePressed(_ sender: UIButton) {
        var tax = 0.0725
        var tip = 0.1
        finalBillAmount.text = "Working!"
    }
    
    
}

