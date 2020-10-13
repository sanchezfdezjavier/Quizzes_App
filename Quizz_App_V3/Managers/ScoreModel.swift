//
//  ScoreModel.swift
//  Quizz_App_V3
//
//  Created by Javi Sanchez on 13/10/2020.
//

import Foundation

class ScoreModel: ObservableObject {
    
    //@Published var score: Int
    @Published var checkedIds: Set<Int> = []
    
    func checkAnswer(answer: String, quiz: QuizItem) -> Bool {
        let answ1 = answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        let answ2 = quiz.answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        if (answ1 == answ2) && (!checkedIds.contains(quiz.id)) {
            checkedIds.insert(quiz.id)
            return true
        } else if (answ1 == answ2) && (checkedIds.contains(quiz.id)){
            return true
        }
        return false
    }

}

