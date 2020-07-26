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
    
    func getNowPlaying() ->[String: Any]?{
        let semaphore = DispatchSemaphore (value: 0);
        
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=[Enter your api key here]=en-US&page=1")!,timeoutInterval: Double.infinity);
        request.httpMethod = "GET";
        var dictionary = [String: Any]()
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error));
                return;
            }
//            print(String(data: data, encoding: .utf8)!);
            dictionary = convertToDictionary(text: String(data: data, encoding: .utf8)!) ?? ["error":404]
            semaphore.signal();
        }
        
        task.resume();
        semaphore.wait();
        return dictionary
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
   


