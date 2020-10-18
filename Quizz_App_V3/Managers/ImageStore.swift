//
//  ImageStore.swift
//  P1 Quiz SwiftUI
//
//  Created by Santiago Pavón Gómez on 28/09/2020.
//

import UIKit

class ImageStore: ObservableObject {
    
    // Cache para las imagenes.
    // La clave es un String con la url.
    @Published var imagesCache = [URL:UIImage]()
    
    let noImage = UIImage(named: "noImageAvailable")!
    let errorDownloading = UIImage(named: "imageError")!
    let loadingImage = UIImage(named: "loading")!
    
    // Si la imagen pedida esta en la cache, entonces la devuelve.
    // Si la imagen no esta en la cache entonces la descarga, y
    // actualizara la cache cuando la reciba.
    func image(url: URL?) -> UIImage {
        
        guard let url = url else {
            // Showed image if the quiz has no image
            return noImage
        }
        
        if let img = imagesCache[url] {
            return img
        }
        
        // Showed image while downloading
        self.imagesCache[url] = loadingImage
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url),
               let img = UIImage(data: data) {
                
                print(url)
                
                DispatchQueue.main.async {
                    self.imagesCache[url] = img
                }
            }
        }
        // Showed image when downloading error
        return errorDownloading
    }
}

