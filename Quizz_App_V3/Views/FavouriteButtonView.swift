//
//  FavouriteButtonView.swift
//  Quizz_App_V3
//
//  Created by Javi Sanchez on 14/11/2020.
//

import SwiftUI

struct FavouriteButtonView: View {
    
    var quiz: QuizItem
    @EnvironmentObject var quizModel: QuizModel
    
    var body: some View {
        // Favourite star button
        Button(action: {
            quizModel.toggleFavourite(quiz)
        }) {
            if(quiz.favourite == true){
                
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.yellow)
                    .shadow(color: .yellow, radius: 2)
                    .padding(40)
            } else {
                Image(systemName: "star")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .padding(40)
            }
        }
    }
}

#if DEBUG
struct FavouriteButtonView_Previews: PreviewProvider {
    
    static let quizModel: QuizModel = {
        let qm = QuizModel()
        qm.loadExamples()
        return qm
    }()
    
    static var previews: some View {
        FavouriteButtonView(quiz: quizModel.quizzes[0])
    }
}
#endif
