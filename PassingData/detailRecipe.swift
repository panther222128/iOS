//
//  detailRecipe.swift
//  PassingData
//
//  Created by Panther on 2020/08/02.
//  Copyright © 2020 Panther. All rights reserved.
//

import UIKit

class detailRecipe: UIViewController {
    
    @IBOutlet var detailCountryLabel: UILabel!
    @IBOutlet var detailFarmLabel: UILabel!
    @IBOutlet var detailVarietyLabel: UILabel!
    @IBOutlet var detailTimeLabel: UILabel!
    @IBOutlet var detailMlLabel: UILabel!
    
    var country: String?
    var farm: String?
    var variety: String?
    var time: String?
    var ml: String?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()


    }
    

    func updateUI() {
        if let country = self.country, let farm = self.farm, let variety = self.variety, let time = self.time, let ml = self.ml {
            detailCountryLabel.text = country
            detailFarmLabel.text = farm
            detailVarietyLabel.text = variety
            detailTimeLabel.text = time
            detailMlLabel.text = ml
        }
    }


}
