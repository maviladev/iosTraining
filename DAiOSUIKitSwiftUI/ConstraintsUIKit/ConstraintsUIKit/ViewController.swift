//
//  ViewController.swift
//  ConstraintsUIKit
//
//  Created by Marcos Avila Rodriguez on 08/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var resultDiscount: UILabel!
    @IBOutlet weak var amountTxt: UITextField!
    @IBOutlet weak var discountTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(tecladoUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(tecladoDown), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func tecladoUp(){
        // Retrieve height size of the bounds in iphone SE
        let sizeScreen = UIScreen.main.nativeBounds.height
        if sizeScreen == 1136 && self.view.frame.origin.y == 0 {
            self.view.frame.origin.y = -50
        }
    }
    
    @objc func tecladoDown() {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    @IBAction func calculate(_ sender: UIButton) {
        guard let amount = amountTxt.text else { return }
        guard let discount = discountTxt.text else { return }
        
        let amountConverted = (amount as NSString).floatValue
        let discountConverted = (discount as NSString).floatValue
        
        let totalDiscount = amountConverted * discountConverted / 100
        let totalAmount = amountConverted - totalDiscount
        
        result.text = "$\(totalAmount)"
        resultDiscount.text = "$\(totalDiscount)"
        self.view.endEditing(true)
    }
    
    
    @IBAction func clean(_ sender: UIButton) {
        result.text = "$0.00"
        resultDiscount.text = "$0.00"
        amountTxt.text = ""
        discountTxt.text = ""
    }
}

