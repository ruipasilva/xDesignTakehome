//
//  DetailCharacterView.swift
//  iOSTakeHomeChallenge
//
//  Created by Rui on 24/10/2022.
//

import SwiftUI
import UIKit

struct DetailCharacterView: View {
    
    let character: Character
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("imgHouses")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
               
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading) {
                            Text(character.name)
                                .font(.largeTitle)
                                .foregroundColor(Color("Gray"))
                                .padding(.bottom, 8)
                            
                            DetailComponents(title: "Titles:", items: character.titles, SFSymbol: "crown")
                            DetailComponents(title: "Aliases:", items: character.aliases, SFSymbol: "shield")
                            DetailComponents(title: "Played By:", items: character.playedBy, SFSymbol: "person")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                        
                    }
                    .padding(.top, 32)
                    .padding(.bottom, 22)
            }
            
        }
    }
}




