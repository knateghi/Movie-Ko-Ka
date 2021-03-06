//
//  MovieDetail.swift
//  Movie Ko Ka
//
//  Created by SaguoRan Jiang on 2020-07-26.
//  Copyright © 2020 Kobra nateghi. All rights reserved.
//

import SwiftUI
import URLImage


//let movieDBKey = "02308057abae9b91afa1f03630322904"
//let movieDBImageUrl = "https://image.tmdb.org/t/p/original/"

struct MovieDetailPage: View {
    let movie: Movie
    let cast: [MovieCast]

    init(_ movieId: Int) {
        movie = getMovieDetail(movieId)!
        cast = getMovieCast(movieId)!
    }

    var body: some View {
        VStack {
            MovieDropbackImage(url: movie.backdropURL)
            VStack {
                HStack {
                    Text(movie.title)
                            .font(.title)
                    Spacer()
                    Text(movie.voteAveragePercentText)
                }
                Text(movie.overview)
                Spacer()
            }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            List{
                URLImage(cast[0].profileURL!,
                content: {
                    $0.image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .padding(.all)
                        .shadow(radius: 10.0)
                })
                
                
                
            }
        }.navigationBarTitle("Movie Detail")
    }
}


struct MovieDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailPage(385103)
    }
}
