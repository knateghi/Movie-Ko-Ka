//
//  ContentView.swift
//  Movie Ko Ka
//
//  Created by Kobra nateghi on 2020-06-23.
//  Copyright © 2020 Kobra nateghi. All rights reserved.
//

import SwiftUI
import URLImage

let movies: [Dictionary<String, Any>] = getNowPlaying()!["results"] as! [Dictionary<String, Any>]

struct ContentView: View {
    init() {
        if #available(iOS 14.0, *) {
            // iOS 14 doesn't have extra separators below the list by default.
        } else {
            // To remove only extra separators below the list:
            UITableView.appearance().tableFooterView = UIView()
        }

        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }

    var body: some View {
        NavigationView {

            List(1..<movies.count) {
                i in
                MovieOverview(
                        movie: movies[i]
                )
                NavigationLink(destination: MovieDetailPage(movies[i]["id"] as! Int)) {
                    EmptyView()
                }.hidden().frame(width: 0)
                        .navigationBarTitle(Text("Movies"))
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
