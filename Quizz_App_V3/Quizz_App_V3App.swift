//
//  Quizz_App_V3App.swift
//  Quizz_App_V3
//
//  Created by Javi Sanchez on 08/10/2020.
//

import SwiftUI

@main
struct Quizz_App_V3App: App {
    
    let quizModel: QuizModel = {
        let qm = QuizModel()
        qm.load()
        return qm
    }()
    let scoreModel = ScoreModel()
    let imageStore = ImageStore()
    let favouritesModel = FavouritesModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(quizModel)
                .environmentObject(imageStore)
                .environmentObject(scoreModel)
                .environmentObject(favouritesModel)
        }
    }
}
