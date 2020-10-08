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
            .aspectRatio(contentMode: .fit)
            .frame(width: 300 ,alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white, lineWidth: 10))
            .cornerRadius(10)
            .padding(5)
    }
}

struct ImageView_Previews: PreviewProvider {
    
    static var imageStore: ImageStore = ImageStore()
    
    static var previews: some View {
        ImageView(image: imageStore.defaultImage)
    }
}
