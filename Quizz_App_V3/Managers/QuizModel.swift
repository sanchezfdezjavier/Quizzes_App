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
    var favourite: Bool
    
    struct Author: Codable {
        let isAdmin: Bool?
        let username: String?
        let profileName: String?
        let photo: Attachment?
    }
    
    struct Attachment: Codable {
        let filename: String
        let mime: String
        let url: URL?
    }
}


class QuizModel: ObservableObject {
    
    @Published private(set) var quizzes = [QuizItem]()
    let session = URLSession.shared
    let urlBase = "https://core.dit.upm.es"
    let TOKEN: String = "79883822125bf8227713"
    
    func load() {
        
        let s = "\(urlBase)/api/quizzes/random10wa?token=\(TOKEN)"
        
        guard let url = URL(string: s) else {
            print("An error has ocurred creating URL")
            return
        }
        
        // HTTP request
        let t = session.dataTask(with: url) { (data, res, error) in
            if error != nil {
                print("Request failed")
                return
            }
            if (res as! HTTPURLResponse).statusCode != 200 {
                print("Request successful")
                return
            }
            
            let decoder = JSONDecoder()
            
            if let quizzes = try? decoder.decode([QuizItem].self, from: data!){
                
                // print("Quizzes cargados")
                DispatchQueue.main.async {
                    self.quizzes = quizzes
                }
            }
        }
        t.resume()
    }
    
    func toggleFavourite(_ quizItem: QuizItem){
        guard let index = quizzes.firstIndex(where: {$0.id == quizItem.id}) else {
                print("Error toggleFavourite")
                return
        }
        
        let surl = "\(urlBase)/api/users/tokenOwner/favourites/\(quizItem.id)?token=\(TOKEN)"
        
        guard let url = URL(string: surl) else {
            print("Error toggleFavourite2")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = quizItem.favourite ? "DELETE" : "PUT"
        request.addValue("XMLHttpRequest", forHTTPHeaderField: "X-Requested-With")
        
        let t = session.uploadTask(with: request, from: Data()) { (data, res, error) in
            if error != nil {
                print("Fallo 20", error)
                return
            }
            
            if (res as! HTTPURLResponse).statusCode != 200 {
                print("Fallo 30")
                return
            }
            
            DispatchQueue.main.async{
                self.quizzes[index].favourite.toggle()
            }
        }
        
        t.resume()
    }
    
    //completar
    func loadExamples(){
        //code
    }
}

#if DEBUG
struct QuizModel_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
#endif
