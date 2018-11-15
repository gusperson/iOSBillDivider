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
   /* func textFieldDidEndEditing(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let dotCount = textField.text!.components(separatedBy: ".").count - 1
        
        if dotCount > 0 && string == "."{
            return false
        }
        
        return true

    }*/

}

