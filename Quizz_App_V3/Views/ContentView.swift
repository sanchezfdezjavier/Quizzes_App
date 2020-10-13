//
//  ContentView.swift
//  Quizz_App_V3
//
//  Created by Javi Sanchez on 08/10/2020.
//

import SwiftUI

struct ContentView: View {
    
    var model: QuizModel
    
    @EnvironmentObject var scoreModel: ScoreModel
    @EnvironmentObject var favouritesModel: FavouritesModel
    @State var toggleShow: Bool
    
    var body: some View {
        
        NavigationView{
            List{
                ForEach(model.quizzes) { quiz in
                    // If toggle favourites is active
                    if(favouritesModel.showFavourites){
                        if(favouritesModel.favouriteIds.contains(quiz.id)){
                            NavigationLink(destination: QuizView(quiz: quiz)) {
                                QuizRowView(quiz: quiz)
                            }
                        }
                        // If toggle favourites disabled
                    } else {
                        NavigationLink(destination: QuizView(quiz: quiz)) {
                            QuizRowView(quiz: quiz)
                        }
                    }
                }
            }
            .navigationBarItems(trailing: Toggle(isOn: $favouritesModel.showFavourites) {
                Image(systemName: "star.fill").foregroundColor(.yellow)
            }.toggleStyle(SwitchToggleStyle(tint: .yellow)))
            .navigationTitle("P1 Quiz app")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let model = QuizModel.shared
        ContentView(model: model, toggleShow: false)
    }
}
