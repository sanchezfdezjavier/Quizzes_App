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
    @EnvironmentObject var favouritesModel: FavouritesModel
    
    var body: some View {
        HStack{
            Image(uiImage: imageStore.image(url: quiz.attachment?.url))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 120)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            //Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
            VStack(){
                Text(quiz.question).bold()
                HStack{
                    AuthorView(imageStore: _imageStore, quiz: quiz)
                    //Favourites placeholder
                }
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
