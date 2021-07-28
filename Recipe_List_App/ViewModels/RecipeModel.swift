//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Kevin Tooley on 7/25/21.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // create an instance of data service and get data
        self.recipes = DataService.getLocalData()
        
    }
    
}
