//
//  ScoreModel.swift
//  Quizz_App_V3
//
//  Created by Javi Sanchez on 13/10/2020.
//

import Foundation

class ScoreModel: ObservableObject {
    
    // Successful quizzes answered
    @Published var checkedIds: Set<Int> = []
    
    func checkAnswer(answer: String, quiz: QuizItem) -> Bool {
        let userInput = answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        let quizAnswer = quiz.answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        if ((userInput == quizAnswer) && (!checkedIds.contains(quiz.id))) {
            checkedIds.insert(quiz.id)
            return true
        } else if (userInput == quizAnswer) && (checkedIds.contains(quiz.id)){
            return true
        }
        return false
    }

}

