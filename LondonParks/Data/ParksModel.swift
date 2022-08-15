//
//  ParksModel.swift
//  LondonParks
//
//  Created by Parsa Shobany on 13/08/2022.
//

import Foundation
import SwiftUI
import CoreLocation

struct Parks2 : Hashable, Codable {
    var id : Int
    var name: String
    var parkType: String
    var boroughs: String
    var description: String
    var shortInfo: String
    var city: String
    var gradientColors: [String]
    var isFeatured: Bool
    var isFavorite: Bool
    var gallery : [String]
    var imageName: String
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)}
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
