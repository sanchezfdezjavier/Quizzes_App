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
    let imageStore = ImageStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView(model: model)
                .environmentObject(imageStore)
        }
    }
}
