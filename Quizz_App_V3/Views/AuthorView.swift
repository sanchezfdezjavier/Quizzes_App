//
//  AuthorView.swift
//  Quizz_App_V3
//
//  Created by Javi Sanchez on 08/10/2020.
//

import SwiftUI

struct AuthorView: View {
    
    @EnvironmentObject var imageStore: ImageStore
    let quiz: QuizItem
    
    var body: some View {
        
        HStack {
            Image(uiImage: imageStore.image(url: quiz.author?.photo?.url))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .shadow(radius: 1.5)
            Text(quiz.author?.username ?? "Uknown author")
        }
    }
}

struct AuthorView_Previews: PreviewProvider {
    static var previews: some View {
        let model = QuizModel.shared
        AuthorView(quiz: model.quizzes[0])
    }
}
