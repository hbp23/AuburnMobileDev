//
//  InfoViewController.swift
//  TableViewApp
//
//  Created by Harsh Patel on 7/1/25.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var CityStateName: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var highlightOneLabel: UILabel!
    @IBOutlet weak var highlightTwoLabel: UILabel!
    @IBOutlet weak var highlightThreeLabel: UILabel!
    
    var selectedCity: City!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        CityStateName.text = "\(selectedCity.city), \(selectedCity.state)"
        nicknameLabel.text = selectedCity.nickname
        populationLabel.text = selectedCity.population
        highlightOneLabel.text = "      \(selectedCity.one)"
        highlightTwoLabel.text = "      \(selectedCity.two)"
        highlightThreeLabel.text = "      \(selectedCity.three)"
    }
    
    @IBAction func BackButton(_ sender: UIButton) {
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
