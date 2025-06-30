//
//  ConversionAmountView.swift
//  CurrencyConverter
//
//  Created by Harsh Patel on 6/29/25.
//

import UIKit

class ConversionAmountView: UIViewController {

    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var mxnLabel: UILabel!
    @IBOutlet weak var inrLabel: UILabel!
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    
    @IBOutlet weak var mxnView: UIStackView!
    @IBOutlet weak var inrView: UIStackView!
    @IBOutlet weak var cadView: UIStackView!
    @IBOutlet weak var jpyView: UIStackView!
    
    var converterLogic: ConverterLogic!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mxnView.isHidden = true
        inrView.isHidden = true
        cadView.isHidden = true
        jpyView.isHidden = true
        usdLabel.text = "$\(converterLogic.getUsdValue())"
        if converterLogic.getPesoSwitchValue() {
            mxnLabel.text = "$\(converterLogic.getPesoAmount())"
            mxnView.isHidden = false
        }
        if converterLogic.getRupeeSwitchValue() {
            inrLabel.text = "₹\(converterLogic.getRupeeAmount())"
            inrView.isHidden = false
        }
        if converterLogic.getDollarSwitchValue() {
            cadLabel.text = "$\(converterLogic.getDollarAmount())"
            cadView.isHidden = false
        }
        if converterLogic.getYenSwitchValue() {
            jpyLabel.text = "¥\(converterLogic.getYenAmount())"
            jpyView.isHidden = false
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
