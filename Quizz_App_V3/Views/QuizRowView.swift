//
//  QuizRowView.swift
//  Quizz_App_V3
//
//  Created by Javi Sanchez on 08/10/2020.
//

import SwiftUI

struct QuizRowView: View {
    
    var quiz: QuizItem
    @EnvironmentObject var imageStore: ImageStore
    
    var body: some View {
        HStack{
            Image(uiImage: imageStore.image(url: quiz.attachment?.url))
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .scaledToFit()
                .frame(width: 125)
                .shadow(color: .gray, radius: 2, x: 0, y: 3)
            //Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
            VStack(){
                Text(quiz.question).bold()
                AuthorView(imageStore: _imageStore, quiz: quiz)
                Spacer()
            }
        }
    }
}

struct QuizRowView_Previews: PreviewProvider {
    static var previews: some View {
        QuizRowView(quiz: QuizModel.shared.quizzes[0])
    }
}
