//
//  MovieDetail.swift
//  Movie Ko Ka
//
//  Created by SaguoRan Jiang on 2020-07-26.
//  Copyright © 2020 Kobra nateghi. All rights reserved.
//

import SwiftUI
import URLImage

struct MovieDetailPage: View {
    let movieDetail: Dictionary<String, Any>
    
   let movieDropbackImage: String
    var text: String = "Hey"
    
    var propertyText: String{
        text
    }
    
    init(_ movieId: Int) {
        
            movieDetail = getMovieDetail(movieId)!
            movieDropbackImage =  movieDetail["backdrop_path"] as! String
        
        text = "Wait"
    }
    
    var body: some View {
        
        VStack{
            
            MovieDropbackImage(url: URL(string: "\(movieDBImageUrl)\(movieDropbackImage)")!)
            
            Spacer()
        }.navigationBarTitle("Movie Detail")
    }
}

//struct MovieDetailPage_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailPage()
//    }
//}
