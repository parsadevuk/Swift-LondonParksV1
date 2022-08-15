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
    var parkNumber : Int
    
    var body: some View {
        TabView{
            ScrollView{
                Text(parksData[parkNumber].name)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.black)
                MapView(coordinate: parksData[parkNumber].locationCoordinate)
                    .frame(height: 250)
                    .ignoresSafeArea(edges: .top)
                    .cornerRadius(15)
                imageCircleTheme(imageName: Image(parksData[parkNumber].imageName), imageSize: 200, ollw: 5, shRad: 5, cColor: Color.orange)
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
                        Text("About \(parksData[parkNumber].name)")
                            .font(.largeTitle)
                            .padding(.leading, 20)
                        Spacer()
                    }
                    Text(parksData[parkNumber].shortInfo)
                        .font(.title)
                        .offset(y:10)
                        //.padding(.bottom,10)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 10))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                    HStack{
                        Text("Hi")
                        Spacer()
                        Text("Ho")
                    }
                }
                .background()
                .cornerRadius(10)
            }
            .tabViewStyle(PageTabViewStyle())
            .padding(.vertical, 20)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [.blue,.black]), startPoint: .top, endPoint: .bottom))
            .ignoresSafeArea(.all, edges: [.top, .bottom])
        }
    }
}

struct onBoardingCard_Previews: PreviewProvider {
    static var previews: some View {
        onBoardingCard(parkNumber: 0)
            
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
extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
