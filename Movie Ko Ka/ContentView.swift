//
//  ContentView.swift
//  Movie Ko Ka
//
//  Created by Kobra nateghi on 2020-06-23.
//  Copyright © 2020 Kobra nateghi. All rights reserved.
//

import SwiftUI
import URLImage

struct ContentView: View {
    let url = URL(string: "https://image.tmdb.org/t/p/original/9zrbgYyFvwH8sy5mv9eT25xsAzL.jpg")!
       
        var body: some View {
            URLImage(url,content: {
                $0.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .padding(.all, 40.0)
                    .shadow(radius: 10.0)
            })
            
        }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
