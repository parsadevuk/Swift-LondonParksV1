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
    var parikNumber : Int
    
    var body: some View {
        TabView{
            ScrollView{
                Text(parksData[parikNumber].name)
                    .font(.largeTitle)
                    .bold()
                MapView(coordinate: parksData[parikNumber].locationCoordinate)
                    .frame(height: 250)
                    .ignoresSafeArea(edges: .top)
                    .cornerRadius(15)
                imageCircleTheme(imageName: Image(parksData[parikNumber].imageName), imageSize: 200, ollw: 5, shRad: 5, cColor: Color.orange)
                    .offset(y:-90)
                    .padding(.bottom,-90)
                Divider()
                
                VStack(alignment: .leading){
                    Spacer()
                    Text("""
Borough: \(parksData[0].boroughs)
City: \(parksData[0].city)
""")
                    .font(.title)
                    .padding(.leading, 20)
                    Spacer()
                    Divider()
                    HStack{
                        Text("About \(parksData[parikNumber].name)")
                            .font(.largeTitle)
                            .padding(.leading, 20)
                        Spacer()
                    }
                    Text(parksData[parikNumber].description)
                        .font(.title)
                        .offset(y:10)
                        //.padding(.bottom,10)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 10))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                }
                .background()
                .cornerRadius(10)
            }
            .tabViewStyle(PageTabViewStyle())
            .padding(.vertical, 20)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [.blue,.cyan]), startPoint: .top, endPoint: .bottom))
            .ignoresSafeArea(.all, edges: [.top, .bottom])
        }
    }
}

struct onBoardingCard_Previews: PreviewProvider {
    static var previews: some View {
        onBoardingCard(parikNumber: 0)
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
