//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Kevin Tooley on 7/25/21.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    @State var servingSize = 2
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Picker
                VStack(alignment: .leading) {
                    Text("Select your serving size:")
                    Picker("", selection: $servingSize) {
                        
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                        
                    }.pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                }.padding()
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom, .top], 5.0)
                    ForEach(recipe.ingredients) { item in
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: servingSize) + " " + item.name.lowercased())
                    }
                }
                .padding(.horizontal)
                // MARK: Divider
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom, .top], 5.0)
                    
                    ForEach (0..<recipe.directions.count, id: \.self) { index in
                        
                        Text(String(index+1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5)
                        
                    }
                    
                }
                .padding(.horizontal)
                
            }
            
        }
        .navigationBarTitle(recipe.name)
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        //Set a dummy recipe for preview
        let model = RecipeModel()
        
        //RecipeDetailView()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
