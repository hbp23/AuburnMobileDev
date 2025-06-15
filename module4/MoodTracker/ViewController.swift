//
//  ViewController.swift
//  module4
//
//  Created by Harsh Patel on 6/15/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    
    @IBOutlet weak var dateChosen: UIDatePicker!
    @IBOutlet weak var feelingLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = "How do you feel today?"
        feelingLabel.text = "Feeling: Unknown ❓"
    }
    
    
    @IBAction func moodSlider(_ sender: UISlider) {
        feelingLabel.text = "Feeling: \(feelingDetermine(sender: sender))"
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        let currentDate = dateChosen.date
        let feelingString = feelingLabel.text
        let emoji = feelingString?.last ?? "❓"
        
        let formatter = DateFormatter()
        formatter.dateStyle  = .medium
        formatter.timeStyle  = .none
        let dateString = formatter.string(from: currentDate)
        
        descriptionLabel.text = "On \(dateString), you felt \(emoji)"
    }
    
    
    func feelingDetermine(sender: UISlider) -> String {
        let num = round(sender.value)
        if num <= 20 {
            mainView.backgroundColor = .systemBlue
            return "Very Sad 😢"
        }
        else if num <= 40 {
            mainView.backgroundColor = .systemTeal
            return "Sad 🙁"
        }
        else if num <= 60 {
            mainView.backgroundColor = .systemGray
            return "Neutral 😐"
        }
        else if num <= 80 {
            mainView.backgroundColor = .systemOrange
            return "Happy 🙂"
        }
        else if num <= 100 {
            mainView.backgroundColor = .systemYellow
            return "Very Happy 😄"
        }
        else {
            mainView.backgroundColor = .systemRed
            return "Error 🤬" }
    }
}

