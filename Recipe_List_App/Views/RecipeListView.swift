//
//  ContentView.swift
//  Recipe List App
//
//  Created by Kevin Tooley on 7/25/21.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                Text("All Recipes")
                    .bold()
                    .padding(.top, 40)
                    .font(Font.custom("Avenir Heavy", size: 24))
                
                
                ScrollView {

                    LazyVStack(alignment: .leading) {
                        
                        ForEach (model.recipes) { r in
                            
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
                                        VStack(alignment: .leading) {
                                            Text(r.name)
                                                .font(Font.custom("Avenir Heavy", size: 16))
                                            RecipeHighlights(highlights: r.highlights)
                                        }.foregroundColor(.black)
                                    }
                                    
                                })

                        }
                    }
                }
                
            }.navigationBarHidden(true)
            .padding(.leading, 10)
        }
        
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
