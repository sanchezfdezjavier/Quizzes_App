//
//  QuizView.swift
//  Quizz_App_V3
//
//  Created by Javi Sanchez on 08/10/2020.
//

import SwiftUI

struct QuizView: View {
    
    var quiz: QuizItem
    @EnvironmentObject var imageStore: ImageStore
    
    @State private var showCorrectAnswer = false
    @State private var answer: String = ""
    @State private var isCorrect: Bool = false
    @State private var alertText: String = ""
    
    var body: some View {
        
        VStack {
            // Question Card
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color.blue)
                .padding(.horizontal)
                .overlay(VStack{
                    ImageView(image: imageStore.image(url: quiz.attachment?.url))
                    Text(self.quiz.question)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    // Author view
                    AuthorView(quiz: self.quiz)
                        .foregroundColor(.white)
                }).shadow(radius: 5)
            // Text field
            TextField("Type your answer", text: $answer)
                .textFieldStyle(RoundedBorderTextFieldStyle()).padding(.all)
            HStack {
                // Check button
                Button(action: {
                    if(self.answer == self.quiz.answer){
                        self.alertText = "Correct!"
                    }else{
                        self.alertText = "Incorrect, try again"
                    }
                    self.isCorrect = true
                    
                }) {
                    RoundedRectangle(cornerRadius: 20).frame(height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.green)
                        .padding()
                        .overlay(Text("Check!").font(.title2).foregroundColor(.white).bold())
                        .shadow(radius: 5)
                }.alert(isPresented: $isCorrect, content: {
                    Alert(title: Text(alertText), dismissButton: .default(Text("Done")))
            })
                // View answer button
                Button(action: {
                    self.showCorrectAnswer = true
                }) {
                    RoundedRectangle(cornerRadius: 20).frame(height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.purple)
                        .padding()
                        .overlay(Text("View answer").foregroundColor(.white).font(.title2).bold())
                        .shadow(radius: 5)
                }.alert(isPresented: $showCorrectAnswer, content: {
                    Alert(title: Text(self.quiz.answer), dismissButton: .default(Text("Done")))
                })
            }
        }
        
    }
}

struct QuizView_Previews: PreviewProvider {
    
    static var previews: some View {
        QuizView(quiz: QuizModel.shared.quizzes[0])
    }
}
