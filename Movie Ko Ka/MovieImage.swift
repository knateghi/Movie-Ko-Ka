//
//  MovieImage.swift
//  Movie Ko Ka
//
//  Created by SaguoRan Jiang on 2020-07-26.
//  Copyright © 2020 Kobra nateghi. All rights reserved.
//

import SwiftUI
import URLImage

struct MovieImage: View {
    var url: URL;
    var body: some View {
          URLImage(url,content: {
                        $0.image
                            .resizable()
                            .frame(width: 140, height: 200)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .padding(.all, 8.0)
                            .shadow(radius: 10.0)
                    })
    }
}

struct MovieImage_Previews: PreviewProvider {
    static var previews: some View {
        MovieImage(url: URL(string: "https://image.tmdb.org/t/p/original/9zrbgYyFvwH8sy5mv9eT25xsAzL.jpg")!)
    }
}
