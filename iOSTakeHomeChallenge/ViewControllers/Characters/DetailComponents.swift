//
//  DetailComponents.swift
//  iOSTakeHomeChallenge
//
//  Created by Rui on 24/10/2022.
//

import SwiftUI

struct DetailComponents: View {
    
    let title: String
    let items: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .foregroundColor(Color("Gray"))
            ForEach(items, id: \.self) {
                Text($0)
                    .foregroundColor(.white)
                    .padding(4)
            }
        }
        .padding(.bottom, 8)
    }
}
