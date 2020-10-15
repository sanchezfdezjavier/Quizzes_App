//
//  Quizz_App_V3App.swift
//  Quizz_App_V3
//
//  Created by Javi Sanchez on 08/10/2020.
//

import SwiftUI

@main
struct Quizz_App_V3App: App {
    
    let model = QuizModel.shared
    let scoreModel = ScoreModel()
    let imageStore = ImageStore()
    let favouritesModel = FavouritesModel()

    var body: some Scene {
        WindowGroup {
            ContentView(model: model, toggleShow: false)
                .environmentObject(imageStore)
                .environmentObject(scoreModel)
                .environmentObject(favouritesModel)
        }
    }
}
