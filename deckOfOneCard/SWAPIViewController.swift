//
//  SWAPIViewController.swift
//  deckOfOneCard
//
//  Created by Haley Jones on 5/13/19.
//  Copyright © 2019 HaleyJones. All rights reserved.
//

import UIKit

class SWAPIViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var hairColorLabel: UILabel!
    @IBOutlet weak var eyeColorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        guard let identifierAsString = searchField.text, let identifier = Int(identifierAsString) else {return}
        PersonController.shared.fetchPersonWith(identifier: identifier) { (character) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                self.nameLabel.text = character?.name
                self.birthYearLabel.text = character?.birthYear
                self.hairColorLabel.text = character?.hairColor
                self.eyeColorLabel.text = character?.eyeColor
            }
        }
    }
}
