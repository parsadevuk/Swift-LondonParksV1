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
            (Color(hex: parksData[parkNumber].colorSets[0])!),
            (Color(hex: parksData[parkNumber].colorSets[1])!),
            (Color(hex: parksData[parkNumber].colorSets[2])!)]
        VStack{
            ScrollView{
                Text(parksData[parkNumber].name)
                    .font(.largeTitle)
                    .bold()
                MapView(number: parkNumber)
                    .frame(height: 200)
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
                    Text(parksData[parkNumber].description)
                        .font(.body)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 10))
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
                        Button(action: {
                            appleMap(latitude: parksData[parkNumber].locationCoordinate.latitude, longitude: parksData[parkNumber].locationCoordinate.longitude)
                        }, label:{
                            Text("Map")
                            Image("icon-apple-maps")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .leading)
                                .shadow(radius: 5)
                        })
                        .padding(.horizontal, 30)}
                        Text("Full description")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .font(.largeTitle)
                            .padding(.horizontal, 30)
                }
                .background()
                .cornerRadius(10)
            }
            .tabViewStyle(PageTabViewStyle())
            .padding(10)
            .padding(.bottom, 30)
            .background(LinearGradient(gradient: Gradient(colors: [varibleColor[0],varibleColor[1]]), startPoint: .top, endPoint: .bottom))
            .ignoresSafeArea(.all, edges: [ .bottom])
            .shadow(color: varibleColor[2], radius: 10)
            .cornerRadius(50)
        }
    }
}

struct onBoardingCard_Previews: PreviewProvider {
    static var previews: some View {
        onBoardingCard(parkNumber: 0)
            
    }
}




