//
//  ImageView.swift
//  Quizz_App_V3
//
//  Created by Javi Sanchez on 08/10/2020.
//

import SwiftUI

struct ImageView: View {
    
    let image : UIImage
    let width: CGFloat
    let heigth: CGFloat
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: self.width, height: self.heigth)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(RoundedRectangle(cornerRadius: 20).strokeBorder(Color.white, lineWidth: 5))
    }
}

struct ImageView_Previews: PreviewProvider {
    
    static var imageStore: ImageStore = ImageStore()
    
    static var previews: some View {
        ImageView(image: imageStore.defaultImage, width: 400, heigth: 400)
    }
}
