//
//  DataService.swift
//  Recipe List App
//
//  Created by Kevin Tooley on 7/25/21.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        // Parse local data file
        
        //get url path
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // create url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // create data object
            let data = try Data(contentsOf: url)
            
            // decode data with json decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // add the unique id's
                for r in recipeData {
                    r.id = UUID()
                }
                
                // return the recipes
                return recipeData
            }
            catch {
                print(error)
            }
            
            
            
        }
        catch {
            print(error)
        }
        
        return [Recipe]()
        
        
        
    }
    
    
}
