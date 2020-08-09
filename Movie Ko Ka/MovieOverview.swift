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
    var movie: Movie
    var body: some View {

        HStack {
            MoviePosterImage(url: movie.posterURL)
            VStack(alignment: .leading) {
                HStack {
                    Text(movie.title).font(.headline)
                    Text(movie.yearText).font(.headline).foregroundColor(Color.gray)
                }.padding(.all, 3)
//                VoteAverageView(progress: RingProgress.percent(voteAverage)) .frame( width: 40, height: 40)


                Text(String(Int(movie.voteAverage)*10)+"%")
                        .foregroundColor(Color.orange)
                        .bold()
                        .padding(.all, 8)
                Text(movie.overview)
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
