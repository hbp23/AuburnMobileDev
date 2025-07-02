//
//  ViewController.swift
//  TableViewApp
//
//  Created by Harsh Patel on 7/1/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cityLogic = CityLogic()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityLogic.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = cityLogic.cities[indexPath.row].city
        content.secondaryText = cityLogic.cities[indexPath.row].state
        content.image = UIImage(named: cityLogic.cities[indexPath.row].photoName)
        content.imageProperties.maximumSize = CGSize(width: 40, height: 40)
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let InfoAction = UIContextualAction(style: .normal, title: "Info") { (_, _, _) in
            self.performSegue(withIdentifier: "toInfoView", sender: indexPath)
        }
        let PhotoAction = UIContextualAction(style: .normal, title: "Photo") { (_, _, _) in
            self.performSegue(withIdentifier: "toPhotoView", sender: indexPath)
        }
        
        InfoAction.backgroundColor = .systemGreen
        PhotoAction.backgroundColor = .systemBlue
        
        let config = UISwipeActionsConfiguration(actions: [InfoAction, PhotoAction])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toInfoView", sender: indexPath)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toInfoView" {
            let destination = segue.destination as! InfoViewController
            let indexPath = sender as! IndexPath
            destination.selectedCity = cityLogic.cities[indexPath.row]
        }
        if segue.identifier == "toPhotoView" {
            let destination = segue.destination as! PhotoViewController
            let indexPath = sender as! IndexPath
            destination.selectedCity = cityLogic.cities[indexPath.row]
        }
    }
    
}
