//
//  MovieApiService.swift
//  Movie Ko Ka
//
//  Created by Kobra nateghi on 2020-07-05.
//  Copyright © 2020 Kobra nateghi. All rights reserved.
//

import Foundation

class MovieApiService{

    //    https://image.tmdb.org/t/p/w1280/
    //    https://image.tmdb.org/t/p/w480/
    //    https://image.tmdb.org/t/p/original/
    
    func getNowPlaying(){
        let semaphore = DispatchSemaphore (value: 0);
        
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=02308057abae9b91afa1f03630322904&language=en-US&page=1")!,timeoutInterval: Double.infinity);
        request.httpMethod = "GET";
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error));
                return;
            }
            print(String(data: data, encoding: .utf8)!);
            semaphore.signal();
        }
        
        task.resume();
        semaphore.wait();
    }
    
   

}
