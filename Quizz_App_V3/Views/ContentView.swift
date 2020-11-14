//
//  ContentView.swift
//  Quizz_App_V3
//
//  Created by Javi Sanchez on 08/10/2020.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var quizModel: QuizModel
    @EnvironmentObject var scoreModel: ScoreModel
    @EnvironmentObject var favouritesModel: FavouritesModel
    @State var toggleChecked: Bool = false
    
    // Handle device orientation
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        
        NavigationView {
            List{
                ForEach(quizModel.quizzes, id: \.id) { quiz in
                    NavigationLink(destination: QuizView(quiz: quiz)) {
                        QuizRowView(quiz: quiz)
                    }
                }
            }
            .navigationTitle("Quizzes")
            .navigationBarItems(leading:
                                    ScoreView()
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

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    
    static let quizModel: QuizModel = {
       let qm = QuizModel()
        qm.loadExamples()
        return qm
    }()
    
    static var previews: some View {
        ContentView()
            .environmentObject(quizModel)
    }
}
#endif
