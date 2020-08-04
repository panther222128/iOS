//
//  DataManager.swift
//  PassingData
//
//  Created by Panther on 2020/07/25.
//  Copyright © 2020 Panther. All rights reserved.
//

import Foundation
import CoreData

class DataManager {
    
    static let shared = DataManager()
    private init() {
        
    }
    
    var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    var recipeList = [RecipeData]()
    
    func fetchRecipe() {
        let request: NSFetchRequest<RecipeData> = RecipeData.fetchRequest()
        
        let sortByDataDesc = NSSortDescriptor(key: "dateList", ascending: false)
        request.sortDescriptors = [sortByDataDesc]
        
        do {
            recipeList = try mainContext.fetch(request)
        } catch {
            print(error)
        }
    
        
    }
    
    
    
    var recipeDetailList = [DetailRecipeData]()
    
    func fetchDetailRecipe() {
        let request: NSFetchRequest<DetailRecipeData> = DetailRecipeData.fetchRequest()
        
        do {
            recipeDetailList = try mainContext.fetch(request)
        } catch {
            print(error)
        }
    }
    
    
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PassingDataModel")
        container.loadPersistentStores(completionHandler: {
            (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                    
            }
        }
    }
    
    func addNewRecipe(country: String?, farm: String?, variety: String?, date: Date?) {
        let newRecipe = RecipeData(context: mainContext)
        newRecipe.countryList = country
        newRecipe.farmList = farm
        newRecipe.varietyList = variety
        newRecipe.dateList = Date()
        
        recipeList.append(newRecipe)
        
        saveContext()
        
    }
    


    
    
    func deleteRecipe(country: RecipeData?, farm: RecipeData?, variety: RecipeData?, date: RecipeData?) {
        if let country = country {
            mainContext.delete(country)
        }
        
        if let farm = farm {
            mainContext.delete(farm)
        }
        
        if let variety = variety {
            mainContext.delete(variety)
        }
        
        if let date = date {
            mainContext.delete(date)
        }
        
        saveContext()
    
}
    
    
    
    func addNewDetailRecipe(time: String?, ml: String?) {
        let detailNewRecipe = DetailRecipeData(context: mainContext)
        detailNewRecipe.timeList = time
        detailNewRecipe.mlList = ml
        
        recipeDetailList.append(detailNewRecipe)
        saveContext()
        
    }

    func deleteDetailRecipe(time: DetailRecipeData?, ml: DetailRecipeData?) {
        if let time = time {
            mainContext.delete(time)
        }
        
        if let ml = ml {
            mainContext.delete(ml)
        }
    }

}
