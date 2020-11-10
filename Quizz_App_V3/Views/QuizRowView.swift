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
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .shadow(color: Color.black.opacity(0.4), radius: 1, y:2)
            //Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
            VStack(alignment: .leading){
                Text(quiz.question)
                HStack{
                    AuthorView(imageStore: _imageStore, quiz: quiz)
                    //Favourites placeholder
                }
                Spacer()
            }
        }
    }
}

#if DEBUG
struct QuizRowView_Previews: PreviewProvider {
    
    static let quizModel: QuizModel = {
       let qm = QuizModel()
        qm.loadExamples()
        return qm
    }()
    
    static var previews: some View {
        QuizRowView(quiz: quizModel.quizzes[0])
    }
}
#endif
