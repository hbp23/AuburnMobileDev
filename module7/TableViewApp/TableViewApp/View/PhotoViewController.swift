//
//  PhotoViewController.swift
//  TableViewApp
//
//  Created by Harsh Patel on 7/1/25.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var selectedCity: City!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        backgroundImage.image = UIImage(named: selectedCity.backgroundImage)
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
