//
//  onBoardingCard.swift
//  LondonParks
//
//  Created by Parsa Shobany on 14/08/2022.
//

import SwiftUI
import Foundation
import CoreLocation
import MapKit

struct onBoardingCard: View {
    
    var data: [Parks2] = parksData
    
    
    var body: some View {
        TabView{
            ScrollView{
                //Text(parksData[0].name)
                MapView(coordinate: parksData[0].locationCoordinate)
                    .frame(height: 250)
                    .ignoresSafeArea(edges: .top)
                    .cornerRadius(15)
                imageCircleTheme(imageName: Image(parksData[0].imageName), imageSize: 200, ollw: 5, shRad: 5, cColor: Color.orange)
                    .offset(y:-90)
                    .padding(.bottom,-90)
                Divider()
                VStack(alignment: .leading){
                    Text(parksData[0].name)
                        .font(.largeTitle)
                    HStack(alignment: .top){
                        Text("In Borough of \(parksData[0].boroughs) in \(parksData[0].city)")
                            .font(.title2)
                            Spacer()
                    }
                }
                .padding(.horizontal, 10)
                Divider()
                HStack{
                    Text("About \(parksData[0].name)")
                        .font(.largeTitle)
                    Spacer()
                }
                Text(parksData[0].description)
                    .font(.title)
                    .offset(y:10)
                    .padding(.bottom,10)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [.orange,.cyan]), startPoint: .top, endPoint: .bottom))
    }
}

struct onBoardingCard_Previews: PreviewProvider {
    static var previews: some View {
        onBoardingCard()
    }
}

extension Color {
  init(_ hex: UInt, alpha: Double = 1) {
    self.init(
      .sRGB,
      red: Double((hex >> 16) & 0xFF) / 255,
      green: Double((hex >> 8) & 0xFF) / 255,
      blue: Double(hex & 0xFF) / 255,
      opacity: alpha
    )
  }
}
