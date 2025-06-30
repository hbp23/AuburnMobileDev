//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Harsh Patel on 6/29/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usdField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    var converterLogic = ConverterLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pesoSwitch(_ sender: UISwitch) {
        converterLogic.setPesoSwitch(sender.isOn)
    }
    
    @IBAction func rupeeSwitch(_ sender: UISwitch) {
        converterLogic.setRupeeSwitch(sender.isOn)
    }
    
    @IBAction func dollarSwitch(_ sender: UISwitch) {
        converterLogic.setDollarSwitch(sender.isOn)
    }
    
    @IBAction func yenSwitch(_ sender: UISwitch) {
        converterLogic.setYenSwitch(sender.isOn)
    }
    
    @IBAction func convertButton(_ sender: UIButton) {
        errorLabel.isHidden = true
        converterLogic.setUsdValue(usdField.text ?? "")
        if converterLogic.getInvalidInputError() {
            errorLabel.text = converterLogic.getErrorMessage()
            errorLabel.isHidden = false
        }
        else if converterLogic.getUnknownError() {
            errorLabel.text = converterLogic.getErrorMessage()
            errorLabel.isHidden = false
        }
        else {
            self.performSegue(withIdentifier: "toConversionAmount", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toConversionAmount" {
                let navigation = segue.destination as! ConversionAmountView
                converterLogic.calculateConversions()
                navigation.converterLogic = converterLogic
            }
    }
}

