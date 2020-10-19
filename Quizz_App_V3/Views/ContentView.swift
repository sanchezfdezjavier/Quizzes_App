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
    
    // Handle device orientation
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        
        NavigationView {
            List{
                ForEach(model.quizzes, id: \.id) { quiz in
                    // If toggle favourites is active
                    if(favouritesModel.showFavourites) {
                        // Is the quiz favourited?
                        if(favouritesModel.favouriteIds.contains(quiz.id)){
                            NavigationLink(destination: QuizView(quiz: quiz, model: model)) {
                                QuizRowView(quiz: quiz)
                            }
                            
                        }
                        // If toggle favourites disabled
                    } else {
                        NavigationLink(destination: QuizView(quiz: quiz, model: model)) {
                            QuizRowView(quiz: quiz)
                        }
                    }
                }
            }
            .navigationTitle("Quizzes")
            .navigationBarItems(leading:
                                    ScoreView(model: model)
                                ,trailing: Toggle(isOn: $favouritesModel.showFavourites) {
                                    Image(systemName: "star.fill").foregroundColor(.yellow)
                                }.toggleStyle(SwitchToggleStyle(tint: .yellow)))
        }
        if horizontalSizeClass != .compact {
            HStack{
                Image(systemName: "arrow.right").foregroundColor(Color.gray)
                Text("Swipe to reveal the quizzes!")
                    .foregroundColor(Color.gray)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let model = QuizModel.shared
        ContentView(model: model, toggleShow: false)
    }
}
