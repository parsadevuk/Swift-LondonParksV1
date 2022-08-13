//
//  ContentView.swift
//  LondonParks
//
//  Created by Parsa Shobany on 13/08/2022.
//

import SwiftUI
import Foundation


struct ContentView: View {
    var park = parksData
    
    
    var body: some View {
        List(parksData, id: \.id){ park in
            Text(parksData)
            //Text("1")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
