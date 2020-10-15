//
//  ImageView.swift
//  Quizz_App_V3
//
//  Created by Javi Sanchez on 08/10/2020.
//

import SwiftUI

struct ImageView: View {
    
    let image : UIImage
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 5))
            .shadow(radius: 6)
    }
}

struct ImageView_Previews: PreviewProvider {
    
    static var imageStore: ImageStore = ImageStore()
    
    static var previews: some View {
        ImageView(image: imageStore.defaultImage)
    }
}
