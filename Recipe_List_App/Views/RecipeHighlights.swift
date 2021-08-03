//
//  RecipeHighlights.swift
//  Recipe List App
//
//  Created by Kevin Tooley on 8/2/21.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHighlights = ""
    
    init(highlights:[String]) {
        
        // Loop through highlights and build string
        for index in 0..<highlights.count {
            
            //if this is last loop, don't add comma
            if index == highlights.count - 1 {
                allHighlights += highlights[index]
            }
            else {
                allHighlights += highlights[index] + ", "
            }
            
        }
        
    }
    
    var body: some View {
        Text(allHighlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test", "test1", "test2"])
    }
}
