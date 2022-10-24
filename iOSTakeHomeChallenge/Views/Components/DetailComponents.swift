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
    let SFSymbol: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(Image(systemName: SFSymbol)) \(title)")
                .font(.title)
                .foregroundColor(Color("Gray"))
            ForEach(items, id: \.self) {
                Text("• \($0)")
                    .font(.body)
                    .foregroundColor(.white)
                    .padding(2)
            }
        }
        .padding(.bottom, 8)
    }
}
