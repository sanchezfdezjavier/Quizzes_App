//
//  QuizRowView.swift
//  Quizz_App_V3
//
//  Created by Javi Sanchez on 08/10/2020.
//

import SwiftUI

struct QuizRowView: View {
    
    var quiz: QuizItem
    
    var body: some View {
        HStack{
            Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
            Text(quiz.question)
        }
    }
}

struct QuizRowView_Previews: PreviewProvider {
    static var previews: some View {
        QuizRowView(quiz: QuizModel.shared.quizzes[0])
    }
}
