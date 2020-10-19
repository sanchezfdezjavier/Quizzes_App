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
                .overlay(Circle().strokeBorder(Color.white, lineWidth: 2))
                .shadow(color: Color.black.opacity(0.4), radius: 1, y:1)
            Text(quiz.author?.username ?? "Uknown author").fontWeight(.light)
        }
    }
}

struct AuthorView_Previews: PreviewProvider {
    static var previews: some View {
        let model = QuizModel.shared
        AuthorView(quiz: model.quizzes[0])
    }
}
