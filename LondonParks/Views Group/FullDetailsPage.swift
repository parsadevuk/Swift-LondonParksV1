//
//  FullDetailsPage.swift
//  LondonParks
//
//  Created by Parsa Shobany on 16/08/2022.
//

import SwiftUI

struct FullDetailsPage: View {
    @Environment(\.dismiss) private var dismiss
    @State var isExpanded = false
    
    var parkNumber: Int
    init(parkNumber: Int? = nil) {
        self.parkNumber = parkNumber ?? 0
    }
    
    var body: some View {
        let variableColor : [Color] = [
            (Color(hex: parksData[parkNumber].colorSets[0])!),
            (Color(hex: parksData[parkNumber].colorSets[1])!),
            (Color(hex: parksData[parkNumber].colorSets[2])!)]
        let gradient = LinearGradient(gradient: Gradient(colors: [variableColor[0],variableColor[1]]), startPoint: .top, endPoint: .bottom)
        
        
        ScrollView(){
            Image("\(parksData[parkNumber].id)-01")
                .resizable()
                .frame(height: UIScreen.screenHeight*0.3)
                .scaledToFit()
            VStack(alignment: .leading){
                Text(parksData[parkNumber].name)
                    .font(.custom("Roboto-Black", size: 30, relativeTo: .caption))
                    .padding(.horizontal,30)
                Text(parksData[parkNumber].description)
                    .padding(.horizontal,30)
                Spacer()
            }
            GalleryView()
                .frame(width: geometrySizes.galleryW, height: geometrySizes.galleryH)
            
        }
        .frame(maxWidth: UIScreen.screenWidth, maxHeight: UIScreen.screenHeight-10)
        .background(gradient)
        .background(Color.white) // Set background color to white
        .edgesIgnoringSafeArea(.top)
        
        .navigationBarBackButtonHidden(true)
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.black) // Change the color to black
                        .padding()
                        .background(Color.black.opacity(0.5))
                        .clipShape(Circle())
                        .padding(10)
                }
                )
                
            }
            
        })
    }
    
}

struct FullDetailsPage_Previews: PreviewProvider {
    static var previews: some View {
        FullDetailsPage(parkNumber: 0)
            .previewDevice("iPhone 12 Pro Max")
    }
}
