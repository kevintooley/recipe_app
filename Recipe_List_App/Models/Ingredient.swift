//
//  Ingredient.swift
//  Recipe List App
//
//  Created by Kevin Tooley on 7/30/21.
//

import Foundation

class Ingredient: Identifiable, Decodable {
    
    var id:UUID?
    var name:String
    var num:Int?
    var denom:Int?
    var unit:String?
    
}
