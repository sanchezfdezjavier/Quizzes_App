//
//  ContentView.swift
//  Quizz_App_V3
//
//  Created by Javi Sanchez on 08/10/2020.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var quizModel: QuizModel
    @EnvironmentObject var scoreModel: ScoreModel
    @State var toggleChecked: Bool = false
    
    // Handle device orientation
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        
        NavigationView {
            List{
                ForEach(quizModel.quizzes, id: \.id) { quiz in
                    // Only show unanswered quizzes
                    if(toggleChecked){
                        if(!scoreModel.checkedIds.contains(quiz.id)){
                            NavigationLink(destination: QuizView(quiz: quiz)) {
                                QuizRowView(quiz: quiz)
                            }
                        }
                    } else {
                        NavigationLink(destination: QuizView(quiz: quiz)) {
                            QuizRowView(quiz: quiz)
                        }
                    }
                }
            }
            .navigationTitle("Quizzes")
            .navigationBarItems(leading:
                                    ScoreView()
                                ,trailing: HStack{
                                    Toggle(isOn: $toggleChecked){
                                        Image(systemName: "eye.slash").foregroundColor(.red)
                                        Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
                                    }.toggleStyle(SwitchToggleStyle(tint: .red))
                                    Divider()
                                    Button(action:{
                                        //action code
                                        quizModel.load()
                                    }){
                                        Image(systemName: "arrow.clockwise")
                                    }
                                })
        }
        if horizontalSizeClass != .compact {
            HStack{
                Image(systemName: "arrow.right").foregroundColor(Color.gray)
                Text("Swipe to reveal the quizzes!")
                    .foregroundColor(Color.gray)
            }
        }
        
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    
    static let quizModel: QuizModel = {
       let qm = QuizModel()
        qm.loadExamples()
        return qm
    }()
    
    static var previews: some View {
        ContentView()
            .environmentObject(quizModel)
    }
}
#endif
