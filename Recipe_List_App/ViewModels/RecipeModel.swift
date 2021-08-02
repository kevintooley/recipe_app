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
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            
            // Get a single serving size by multiplying denominator by the recipe servings
            denominator *= recipeServings
            
            // Get target portion by multiplying numerator by target servings
            numerator *= targetServings
            
            // Reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            // Get the whole portions of numerator if > the denominator
            if numerator >= denominator {
                
                // Calculated whole portions
                wholePortions = numerator / denominator
                
                // Calculated the remainder
                numerator = numerator % denominator
            //}
            
            // Express remainder as a fraction
            //if wholePortions > 0 {
                portion += String(wholePortions)
            }
            
            if numerator > 0 {
                
                portion += wholePortions > 0 ? " " : ""
                portion += numerator == denominator ? "\(numerator)" : "\(numerator)/\(denominator)"
                //portion += "\(numerator) / \(denominator)"
            }
            //portion = "\(String(wholePortions)) \(String(numerator))/\(String(denominator)) "
            
        }
        
        if var unit = ingredient.unit {
            
            if wholePortions > 1 {
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
            }
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
            return portion + " " + unit
        }
        
        return portion
    }
    
}
