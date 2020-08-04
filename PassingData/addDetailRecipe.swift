//
//  addDetailRecipe.swift
//  PassingData
//
//  Created by Panther on 2020/08/02.
//  Copyright © 2020 Panther. All rights reserved.
//

import UIKit

class addDetailRecipe: UIViewController {
    
    @IBOutlet var timeAdd: UITextField!
    @IBOutlet var mlAdd: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func btnAdd(_ sender: UIButton) {
        
        let newTime = timeAdd.text!
        let newMl = mlAdd.text!
        
        DataManager.shared.addNewDetailRecipe(time: newTime, ml: newMl)
        
        timeAdd.text = ""
        mlAdd.text = ""
        
    }
    

}
