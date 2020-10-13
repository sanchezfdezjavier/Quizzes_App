//
//  FavouritesModel.swift
//  Quizz_App_V3
//
//  Created by Javi Sanchez on 13/10/2020.
//

import Foundation

class FavouritesModel: ObservableObject {
    
    @Published var favouriteIds: Set<Int> = []
    @Published var showFavourites: Bool = false
    
    func addToFavourites(id: Int){
        if (!favouriteIds.contains(id)){
            favouriteIds.insert(id)
        }
    }
    
    func removeFromFavourites(id: Int){
        if(favouriteIds.contains(id)){
            favouriteIds.remove(id)
        }
    }
    
    func toggleFavourites(){
        showFavourites = !showFavourites
    }
}
