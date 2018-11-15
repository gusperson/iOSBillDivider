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
    func convertCurrencyToDouble(input: String) -> Double? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        
        return numberFormatter.number(from: input)?.doubleValue
    }
    
    func convertDoubleToCurrency(amount: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        
        return numberFormatter.string(from: NSNumber(value: amount))!
    }
    
    func calculateTip(subtotal: Double, tipPercentage: Double) -> Double {
        //calculate tip
        return subtotal * (tipPercentage / 100)
    }
    
    func calculateTax(subtotal: Double, taxPercentage: Double) -> Double {
        return  subtotal * (taxPercentage / 100)
    }
    
    @IBAction func calculatePricePressed(_ sender: UIButton) {
        //finalBillAmount.text = "Working!"
        guard let mealPriceDouble = convertCurrencyToDouble(input: mealPrice.text!) else{
            print("invalid input!")
            return
        }
        
        let tip1 = calculateTip(subtotal: mealPriceDouble, tipPercentage: 10.0)
        let tip2 = calculateTip(subtotal: mealPriceDouble, tipPercentage: 15.0)
        let tip3 = calculateTip(subtotal: mealPriceDouble, tipPercentage: 20.0)
        let tax = calculateTax(subtotal: mealPriceDouble, taxPercentage: 7.25)
        
        tenPercentTip.text = String(convertDoubleToCurrency(amount: tip1))
        fifteenPercentTip.text = String(convertDoubleToCurrency(amount: tip2))
        twentyPercentTip.text = String(convertDoubleToCurrency(amount: tip3))
        taxTotal.text = String(convertDoubleToCurrency(amount: tax))
        
        finalBillAmount.text = String(convertDoubleToCurrency(amount: tip1 + tax + mealPriceDouble))

    }
    
    
}

