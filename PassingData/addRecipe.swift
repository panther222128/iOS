//
//  addRecipe.swift
//  PassingData
//
//  Created by Panther on 2020/07/19.
//  Copyright © 2020 Panther. All rights reserved.
//

import UIKit

class addRecipe: UIViewController {
    
    @IBOutlet var countryAdd: UITextField!
    @IBOutlet var farmAdd: UITextField!
    @IBOutlet var varietyAdd: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    

    
    @IBAction func btnAdd(_ sender: UIButton) {
        
        let newCountry = countryAdd.text!
        let newFarm = farmAdd.text!
        let newVariety = varietyAdd.text!
        let newDate = Date()

        DataManager.shared.addNewRecipe(country: newCountry, farm: newFarm, variety: newVariety, date: newDate)
        
        
        //let newRecipe = recipeList(country: newCountry, farm: newFarm, variety: newVariety)
        //recipeList.dummyRecipeList.append(newRecipe)
        
        
        countryAdd.text = ""
        farmAdd.text = ""
        varietyAdd.text = ""
        
        

        
    }
    



}
