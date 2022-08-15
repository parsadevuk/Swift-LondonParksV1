//
//  MapProcess.swift
//  LondonParks
//
//  Created by Parsa Shobany on 15/08/2022.
//
import SwiftUI

func gMap(latitude:Double, longitude:Double){
    let url = URL(string: "comgooglemaps://?saddr=&daddr=\(latitude),\(longitude)&directionsmode=driving")
    if UIApplication.shared.canOpenURL(url!) {
          UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    else{
          let urlBrowser = URL(string: "https://www.google.co.in/maps/dir/??saddr=&daddr=\(latitude),\(longitude)&directionsmode=driving")

           UIApplication.shared.open(urlBrowser!, options: [:], completionHandler: nil)
    }
}
