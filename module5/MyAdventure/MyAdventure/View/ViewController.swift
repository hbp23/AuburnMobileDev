//
//  ViewController.swift
//  MyAdventure
//
//  Created by Harsh Patel on 6/22/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var optionOne: UIButton!
    @IBOutlet weak var optionTwo: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    var logic = AdventureLogic()
    
    @IBAction func optionPicked(_ sender: UIButton) {
        let index = (sender == optionOne) ? 0 : 1
        logic.choose(optionIndex: index)
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        background.image = UIImage(named: logic.getBackgroundImageName())
        titleLabel.text = logic.getTitle()
        descriptionLabel.text = logic.getDescription()
        
        optionOne.setTitle(logic.getOptionOneText(), for: .normal)
        optionTwo.setTitle(logic.getOptionTwoText(), for: .normal)
    }

}

