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
        
        TabView{
            ForEach((0...nElement), id: \.self){
                item in
                onBoardingCard(parkNumber: item)
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
