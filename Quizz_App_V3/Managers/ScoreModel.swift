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
    
    init(){
        // Singleton stored by the system
        let us = UserDefaults.standard
        
        if let checkedIds = us.object(forKey: "checkedIds") as? [Int] {
            self.checkedIds = Set(checkedIds)
        }
    }
    
    func checkAnswer(answer: String, quiz: QuizItem) -> Bool {
        let userInput = answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        let quizAnswer = quiz.answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        if userInput == quizAnswer, !checkedIds.contains(quiz.id){
            checkedIds.insert(quiz.id)
            let us = UserDefaults.standard
            
            // we can not store sets in UserDefaults
            us.set(Array<Int>(checkedIds), forKey: "checkedIds")
            return true
        }
        return false
    }
    
    func acertado(_ quiz: QuizItem) -> Bool {
        //print
        return true
    }
}



