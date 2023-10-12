//
//  ContentView.swift
//  LondonParks
//
//  Created by Parsa Shobany on 13/08/2022.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    let nElement = parksData.count - 1
    
    var body: some View {
        NavigationView {
            TabView {
                ForEach((0...nElement), id: \.self) {
                    parkIndex in
                    onBoardingCard(parkNumber: parkIndex)
                }
            }
            .tabViewStyle(PageTabViewStyle())
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone SE (3rd generation)")
            .previewDisplayName("iPhone SE (3rd generation)")
        ContentView()
            .previewDevice("iPhone 14 Pro Max")
            .previewDisplayName("iPhone 14 Pro Max")
    }
}
