//
//  QuizModel.swift
//  P1 Quiz SwiftUI
//
//  Created by Santiago Pavón Gómez on 28/09/2020.
//

import Foundation
import SwiftUI


struct QuizItem: Codable, Identifiable {
    let id: Int
    let question: String
    let answer: String
    let author: Author?
    let attachment: Attachment?
    let favourite: Bool
    
    struct Author: Codable {
        let isAdmin: Bool?
        let username: String
        let photo: Attachment?
    }
    
    struct Attachment: Codable {
        let filename: String
        let mime: String
        let url: URL?
    }
}


class QuizModel: ObservableObject {
    
    // Singleton
    private(set) static var shared = QuizModel()
    
    private(set) var quizzes = [QuizItem]()
    
    init() {
       load()
    }
    
    private func load() {
        
        // Bundle.main --> are all the files inside our proyect
        //
        guard let jsonURL = Bundle.main.url(forResource: "p1_quizzes", withExtension: "json") else {
            print("Internal error: No encuentro p1_quizzes.json")
            return
        }
        
        do {
            let data = try Data(contentsOf: jsonURL)
            let decoder = JSONDecoder()
            
            // let str = String(data: data, encoding: String.Encoding.utf8)
            // print("Quizzes ==>", str!)
            
            let quizzes = try decoder.decode([QuizItem].self, from: data)
            
            // print("Quizzes cargados")
            
            self.quizzes = quizzes
        } catch {
            print("Algo chungo ha pasado: \(error)")
        }
    }
    
    
}

#if DEBUG
struct QuizModel_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
#endif
