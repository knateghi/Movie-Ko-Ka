//
//  MovieApiService.swift
//  Movie Ko Ka
//
//  Created by Kobra nateghi on 2020-07-05.
//  Copyright © 2020 Kobra nateghi. All rights reserved.
//

import Foundation


    //    https://image.tmdb.org/t/p/w1280/
    //    https://image.tmdb.org/t/p/w480/
    //    https://image.tmdb.org/t/p/original/

func getNowPlaying() ->MoviePage?{
    let semaphore = DispatchSemaphore (value: 0);

    var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(movieDBKey)&language=en-US&page=1")!,timeoutInterval: Double.infinity);
    request.httpMethod = "GET";
    var moviePage: MoviePage?
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data else {
            print(String(describing: error));
            return;
        }
//            print(String(data: data, encoding: .utf8)!);
//        dictionary = convertToDictionary(text: String(data: data, encoding: .utf8)!) ?? ["error":404]
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        moviePage = load(data)
        semaphore.signal();
    }

    task.resume();
    semaphore.wait();
    return moviePage
}


func getMovieDetail(_ movieId: Int) ->Movie?{
    let semaphore = DispatchSemaphore (value: 0)
    var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/\(movieId)?api_key=\(movieDBKey)&language=en-US")!,timeoutInterval: Double.infinity)
    request.httpMethod = "GET"
    
    var movie:Movie?
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data else {
        print(String(describing: error))
        return
      }
      print(String(data: data, encoding: .utf8)!)
        movie = load(data)
//        movie = convertToDictionary(text: String(data: data, encoding: .utf8)!) ?? ["error":404]
      semaphore.signal()
    }

    task.resume()
    semaphore.wait()
    return movie
}



func getMovieCast(_ movieId: Int) ->[MovieCast]?{

    let semaphore = DispatchSemaphore (value: 0)

    var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/\(movieId)/credits?api_key=\(movieDBKey)")!,timeoutInterval: Double.infinity)
    request.httpMethod = "GET"
    var cast: [MovieCast]?
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data else {
        print(String(describing: error))
        return
      }
      print()
        let movieCreditResponse: MovieCreditResponse = load(data)
        cast = movieCreditResponse.cast
      semaphore.signal()
    }

    task.resume()
    semaphore.wait()
    return cast
}


func convertToDictionary(text: String) -> [String: Any]? {
    if let data = text.data(using: .utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
        }
    }
    return nil
}

func load<T: Decodable>(_ data: Data) -> T {
    do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(data) as \(T.self):\n\(error)")
    }
}


   


