//
//  ScoreView.swift
//  Quizz_App_V3
//
//  Created by Javi Sanchez on 14/10/2020.
//

import SwiftUI

struct ScoreView: View {
    
    @EnvironmentObject var scoreModel: ScoreModel
    @EnvironmentObject var quizModel: QuizModel
    
    var body: some View {
        
        HStack{
            Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
            Text("\(scoreModel.checkedIds.count) / \(quizModel.quizzes.count)").bold()
                .foregroundColor(.green)
        }
    }
}

#if DEBUG
struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
#endif
