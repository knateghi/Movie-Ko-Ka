////
////  MoviePage.swift
////  Movie Ko Ka
////
////  Created by SaguoRan Jiang on 2020-08-09.
////  Copyright © 2020 Kobra nateghi. All rights reserved.
////
//
//import Foundation
//
//
//public struct MoviePage: Codable, Identifiable  {
//    
//    public let results: [Movie]
//    
////    "page": 1,
////       "total_results": 631,
////       "dates": {
////           "maximum": "2020-07-31",
////           "minimum": "2020-06-13"
////       },
////       "total_pages": 32
//    public let page: Int
//    public let totalResults: Int
//    public let dates: String?
////    public let totalPages: String?
//    
//    public var casts: [MovieCast]? {
//        return credits?.cast
//    }
//    
//    public var crews: [MovieCrew]? {
//        return credits?.crew
//    }
//    
//    public var movieVideos: [MovieVideo]? {
//        return videos?.results
//    }
//    
//    static private let yearFormatter: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy"
//        return formatter
//    }()
//    
//    static private let durationFormatter: DateComponentsFormatter = {
//        let formatter = DateComponentsFormatter()
//        formatter.unitsStyle = .full
//        formatter.allowedUnits = [.hour, .minute]
//        return formatter
//    }()
//    
//    public var posterURL: URL {
//        return URL(string: "https://image.tmdb.org/t/p/original\(posterPath ?? "")")!
//    }
//    
//    public var backdropURL: URL {
//        return URL(string: "https://image.tmdb.org/t/p/original\(backdropPath ?? "")")!
//    }
//    
//    public var voteAveragePercentText: String {
//        return "\(Int(voteAverage * 10))%"
//    }
//    
//    public var genreText: String? {
//        guard let movieGenres = self.genres else {
//            return nil
//        }
//        return movieGenres.map { $0.name }.joined(separator: ", ")
//    
//    }
//    
//    public var ratingText: String {
//        let rating = Int(voteAverage)
//        let ratingText = (0..<rating).reduce("") { (acc, _) -> String in
//            return acc + "⭐️"
//        }
//        return ratingText
//    }
//    
//    public var yearText: String {
//        return Movie.yearFormatter.string(from: self.releaseDate)
//    }
//    
//    public var durationText: String? {
//        guard let runtime = self.runtime else {
//            return nil
//        }
//        
//        return Movie.durationFormatter.string(from: TimeInterval(runtime) * 60)
//    }
//    
//    public var homepageURL: URL? {
//        guard let homepage = self.homepage else {
//            return nil
//        }
//        return URL(string: homepage)
//    }
//    
//}
//
