//
//  ContentView.swift
//  Quizz_App_V3
//
//  Created by Javi Sanchez on 08/10/2020.
//

import SwiftUI

struct ContentView: View {
    
    var model: QuizModel
    
    var body: some View {
        
        NavigationView{
            List{
                ForEach(model.quizzes) { quiz in
                    NavigationLink(destination: QuizView(quiz: quiz)) {
                        QuizRowView(quiz: quiz)
                    }
                    
                }
            }
            .navigationTitle("P1 Quiz app")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let model = QuizModel.shared
        ContentView(model: model)
    }
}
