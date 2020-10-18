//
//  ScoreView.swift
//  Quizz_App_V3
//
//  Created by Javi Sanchez on 14/10/2020.
//

import SwiftUI

struct ScoreView: View {
    
    var model: QuizModel
    @EnvironmentObject var scoreModel: ScoreModel
    
    var body: some View {
        
        HStack{
            Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
            Text("\(scoreModel.checkedIds.count) / \(model.quizzes.count)").bold()
                .foregroundColor(.green)
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(model: QuizModel())
    }
}
