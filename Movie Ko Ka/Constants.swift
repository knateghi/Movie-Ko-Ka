//
//  Constants.swift
//  Movie Ko Ka
//
//  Created by SaguoRan Jiang on 2020-07-28.
//  Copyright © 2020 Kobra nateghi. All rights reserved.
//

import Foundation

let movieDBKey: String = "put you key"
let movieDBImageUrl: String = "https://image.tmdb.org/t/p/original/"


struct MoviePage: Hashable, Codable {
    let results: [Movie]
    let page: Int
    let totalResults: Int
    let totalPages: Int
}

struct Movie: Hashable, Codable, Identifiable  {

    let id: Int
    let title: String
    let backdropPath: String?
    let posterPath: String?
    let overview: String
    let releaseDate: Date
    let voteAverage: Double
    let voteCount: Int
    let tagline: String?

    let videos: String?
    let credits: String?
    let adult: Bool
    let runtime: Int?
    let homepage: String?


    static private let yearFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter
    }()

    static private let durationFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.hour, .minute]
        return formatter
    }()


    public var yearText: String {
        return Movie.yearFormatter.string(from: self.releaseDate)
    }
    public var posterURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/original\(posterPath ?? "")")!
    }

    public var backdropURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/original\(backdropPath ?? "")")!
    }

    public var voteAveragePercentText: String {
        return "\(Int(voteAverage * 10))%"
    }
//
//    public var genreText: String? {
//        guard let movieGenres = self.genres else {
//            return nil
//        }
//        return movieGenres.map { $0.name }.joined(separator: ", ")
//
//    }

    public var ratingText: String {
        let rating = Int(voteAverage)
        let ratingText = (0..<rating).reduce("") { (acc, _) -> String in
            return acc + "⭐️"
        }
        return ratingText
    }

//    public var yearText: String {
//        return Movie.yearFormatter.string(from: self.releaseDate)
//    }

    public var durationText: String? {
        guard let runtime = self.runtime else {
            return nil
        }

        return Movie.durationFormatter.string(from: TimeInterval(runtime) * 60)
    }

    public var homepageURL: URL? {
        guard let homepage = self.homepage else {
            return nil
        }
        return URL(string: homepage)
    }

}


public struct MovieCreditResponse: Codable {
    public let cast: [MovieCast]
}


public struct MovieCast:  Hashable, Codable, Identifiable  {
    public let id: Int
    public let character: String
    public let name: String

    public let profilePath: String?
    
    public var profileURL: URL? {
        guard let profilePath = profilePath else {
            return nil
        }
        
        return URL(string: "https://image.tmdb.org/t/p/w500\(profilePath)")!
    }
    
}




