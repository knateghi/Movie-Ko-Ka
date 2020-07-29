//
//  MovieDropPathImage.swift
//  Movie Ko Ka
//
//  Created by SaguoRan Jiang on 2020-07-28.
//  Copyright © 2020 Kobra nateghi. All rights reserved.
//

import SwiftUI
import URLImage

struct MovieDropbackImage: View {
    var url: URL;
       var body: some View {
             URLImage(url,content: {
                           $0.image
                               .resizable()
                               .frame( height: 220)
                               .aspectRatio(contentMode: .fit)
                               .clipShape(RoundedRectangle(cornerRadius: 5))
                            .padding([.leading,.trailing], 8.0)
                               .shadow(radius: 10.0)
                       })
       }
}
//
//struct MovieDropPathImage_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDropbackImage()
//    }
//}
