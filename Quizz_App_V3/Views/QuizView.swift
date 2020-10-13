//
//  QuizView.swift
//  Quizz_App_V3
//
//  Created by Javi Sanchez on 08/10/2020.
//

import SwiftUI

struct QuizView: View {
    
    var quiz: QuizItem
    
    @EnvironmentObject var favouritesModel: FavouritesModel
    @EnvironmentObject var imageStore: ImageStore
    @EnvironmentObject var scoreModel: ScoreModel
    
    @State private var showCorrectAnswer = false
    @State private var answer: String = ""
    @State private var isCorrect: Bool = false
    @State private var alertText: String = ""
    
    var body: some View {
        
        VStack {
            // Question Card
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color.blue)
                .shadow(color: .gray, radius: 3, x: 0, y: 5)
                .padding(.horizontal)
                .overlay(VStack{
                    ImageView(image: imageStore.image(url: quiz.attachment?.url))
                    Text(self.quiz.question)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    // Author view
                    HStack{
                        AuthorView(quiz: self.quiz)
                            .foregroundColor(.white)
                            .padding(40)
                        // Favourite star button
                        Button(action: {
                            if(favouritesModel.favouriteIds.contains(quiz.id)){
                                favouritesModel.removeFromFavourites(id: quiz.id)
                            }else {
                                favouritesModel.addToFavourites(id: quiz.id)
                            }
                        }) {
                            if(!favouritesModel.favouriteIds.contains(quiz.id)){
                                Image(systemName: "star")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                                    .padding(40)
                            }else {
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.yellow)
                                    .shadow(color: .yellow, radius: 4)
                                    .padding(40)
                            }
                        }
                    }
                })
            Text(String(favouritesModel.favouriteIds.contains(quiz.id)))
            // Text field
            TextField("Type your answer", text: $answer)
                .foregroundColor(.gray)
                .padding(.all)
            HStack {
                // Check button
                Button(action: {
                    if(scoreModel.checkAnswer(answer: self.answer, quiz: self.quiz)){
                        self.alertText = "Correct!"
                    }else{
                        self.alertText = "Incorrect, try again"
                    }
                    self.isCorrect = true
                    
                }) {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .shadow(color: .gray, radius: 3, x: 0, y: 3)
                        .foregroundColor(.green)
                        .padding()
                        .overlay(
                            Text("Check!")
                                .font(.title2)
                                .foregroundColor(.white).bold())

                }.alert(isPresented: $isCorrect, content: {
                    Alert(title: Text(alertText), dismissButton: .default(Text("Done")))
            })
                // View answer button
                Button(action: {
                    self.showCorrectAnswer = true
                }) {
                    RoundedRectangle(cornerRadius: 20).frame(height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.purple)
                        .shadow(color: .gray, radius: 3, x: 0, y: 3)
                        .padding()
                        .overlay(Text("View answer").foregroundColor(.white).font(.title2).bold())
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
