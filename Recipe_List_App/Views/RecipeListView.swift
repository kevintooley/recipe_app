//
//  ContentView.swift
//  Recipe List App
//
//  Created by Kevin Tooley on 7/25/21.
//

import SwiftUI

struct RecipeListView: View {
    
    //Reverence view model
    @ObservedObject var model = RecipeModel()
    
    
    var body: some View {
        
        NavigationView {
            List(model.recipes) { r in
                
                NavigationLink(
                    destination: RecipeDetailView(recipe:r),
                    label: {
                        
                        // MARK: Row Item
                        HStack(spacing: 20.0) {
                            Image(r.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50.0, height: 50.0)
                                .clipped()
                                .cornerRadius(5)
                            Text(r.name)
                        }
                        
                    })
                
                
                
            }
            .navigationBarTitle("All Recipes")
        }
        
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
