//
//  VoteAverageView.swift
//  Movie Ko Ka
//
//  Created by SaguoRan Jiang on 2020-07-26.
//  Copyright © 2020 Kobra nateghi. All rights reserved.
//

import SwiftUI
import UICircularProgressRing

struct VoteAverageView: View {
    
   @State var progress: RingProgress
   
    var body: some View {
      
            ProgressRing(
                progress: $progress,
                axis: .top,
                clockwise: true,
                outerRingStyle: .init(
                    color: .color(.gray),
                    strokeStyle: .init(lineWidth: 10 ,lineCap: .round, lineJoin: .round)
                ),
                innerRingStyle: .init(
                    color: .color(.orange),
                    strokeStyle: .init(lineWidth: 5, lineCap: .round, lineJoin: .round ),
                    padding: 3
                    
                )
            ){ percentage in
                HStack(alignment: .center, spacing: 0 ){
                    Text(String(Int(percentage*10)))
                        .font(.system(size: 10))
                    .bold()
                    Text("%").font(.system(size: 6))
                }
                
            }
                .animation(.easeInOut(duration: 0))
               
    }
}

struct VoteAverageView_Previews: PreviewProvider {
    static var previews: some View {
        VoteAverageView(progress: RingProgress.percent(0.74))
    }
}
