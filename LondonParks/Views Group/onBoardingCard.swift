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
        let varibleColor : [Color] = [
            (Color(hex: parksData[parkNumber].gradientColors[0])!),
            (Color(hex: parksData[parkNumber].gradientColors[1])!),
            (Color(hex: parksData[parkNumber].picFrameColor)!)
            ]
        //gColor s are gradient colors
        TabView{
            ScrollView{
                Text(parksData[parkNumber].name)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.black)
                MapView(coordinate: parksData[parkNumber].locationCoordinate)
                    .frame(height: 200)
//                    .offset(y: -30)
//                    .padding(.bottom, -30)
                    .ignoresSafeArea(edges: .top)
                    .cornerRadius(15)
                    .shadow(color: varibleColor[2], radius: 10)
                imageCircleTheme(imageName: Image(parksData[parkNumber].imageName), imageSize: 200, ollw: 5, shRad: 5, cColor: varibleColor[2])
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
                            .font(.title3)
                            .padding(.leading, 20)
                        Spacer()
                    }
                    Text(parksData[parkNumber].shortInfo)
                        .font(.body)
                        //.offset(y:10)
                        //.padding(.bottom,10)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 10))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                    HStack(alignment: .center, spacing: 0){
                        Button(action: {
                            gMap(latitude: parksData[parkNumber].locationCoordinate.latitude, longitude: parksData[parkNumber].locationCoordinate.longitude)
                        }, label: {
                            Text("Google Map")
                            Image("icon-google-maps")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .leading)
                                .shadow(radius: 5)
                        })
                        Spacer()
                        Text("Map")
                        Image("icon-apple-maps")
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .leading)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal, 30)
                        Text("Full description")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .font(.largeTitle)
                            .padding(.horizontal, 30)
                }
                .background()
                .cornerRadius(10)
            }
            .tabViewStyle(PageTabViewStyle())
            .padding(.vertical, 20)
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [varibleColor[0],varibleColor[1]]), startPoint: .top, endPoint: .bottom))
            .ignoresSafeArea(.all, edges: [.top, .bottom])
            .shadow(color: varibleColor[2], radius: 10)
        }
    }
}

struct onBoardingCard_Previews: PreviewProvider {
    static var previews: some View {
        onBoardingCard(parkNumber: 0)
            
    }
}




