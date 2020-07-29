//
//  MovieOverview.swift
//  Movie Ko Ka
//
//  Created by SaguoRan Jiang on 2020-07-26.
//  Copyright © 2020 Kobra nateghi. All rights reserved.
//

import SwiftUI
import UICircularProgressRing

struct MovieOverview: View {
    var movie: Dictionary<String, Any>
//    var image: MovieImage{
//    }
    var releaseDate: String {
        movie["release_date"] as? String ?? ""
    }
    var releaseYear: String {
        String(releaseDate.prefix(upTo: releaseDate.index(releaseDate.startIndex, offsetBy: 4)))
    }
    var title: String {
        movie["title"] as? String ?? ""
    }
    var overview: String {
        movie["overview"] as? String ?? ""
    }
    var voteAverage: Double {
        (movie["vote_average"] as! NSNumber).doubleValue
    }
    var body: some View {

        HStack {
            MoviePosterImage(url: URL(string: "https://image.tmdb.org/t/p/original\(movie["poster_path"]! as! String)")!)
            VStack(alignment: .leading) {
                HStack {
                    Text(title).font(.headline)
                    Text("(\(releaseYear))").font(.headline).foregroundColor(Color.gray)
                }.padding(.all, 3)
//                VoteAverageView(progress: RingProgress.percent(voteAverage)) .frame( width: 40, height: 40)

              
                Text(String(Int(voteAverage)*10)+"%")
                        .foregroundColor(Color.orange)
                        .bold()
                        .padding(.all, 8)
                Text(overview)
                        .padding(.all, 8)
                        .lineLimit(4)
            }
        }.padding(.bottom, 8)
    }
}

//
//struct MovieOverview_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieOverview()
//    }
//}
