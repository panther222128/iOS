//
//  recipeTable.swift
//  PassingData
//
//  Created by Panther on 2020/07/19.
//  Copyright © 2020 Panther. All rights reserved.
//

import UIKit



    
class recipeTable: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var recipeTableView: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? detailRecipe
            if let index = sender as? Int {
            
                let target = DataManager.shared.recipeList[index]
                let targets = DataManager.shared.recipeDetailList[index]
                
                vc?.country = target.countryList
                vc?.farm = target.farmList
                vc?.variety = target.varietyList
                vc?.time = targets.timeList
                vc?.ml = targets.mlList
                
            }

        }
    }
    
    override func viewDidLoad() {

        super.viewDidLoad()
        

    }
    
      let formatter: DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateStyle = .long
      formatter.timeStyle = .short
      formatter.locale = Locale(identifier: "Ko_kr")
      return formatter
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        
        DataManager.shared.fetchRecipe()
        DataManager.shared.fetchDetailRecipe()
        
        recipeTableView.reloadData()
        

    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.recipeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as? recipeCell else {
            return UITableViewCell()
        }
        
        let target = DataManager.shared.recipeList[indexPath.row]
        
        cell.countryLabel?.text = target.countryList
        cell.farmLabel?.text = target.farmList
        cell.varietyLabel?.text = target.varietyList
        cell.dateLabel?.text = formatter.string(for: target.dateList)
        

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let target = DataManager.shared.recipeList[indexPath.row]
            let targets = DataManager.shared.recipeDetailList[indexPath.row]
            
            DataManager.shared.deleteRecipe(country: target, farm: target, variety: target, date: target)
            DataManager.shared.recipeList.remove(at: indexPath.row)
            DataManager.shared.deleteDetailRecipe(time: targets, ml: targets)
            DataManager.shared.recipeDetailList.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
               
        } else if editingStyle == .insert {
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
    
    

}

class recipeCell: UITableViewCell {
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var farmLabel: UILabel!
    @IBOutlet var varietyLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    
}
