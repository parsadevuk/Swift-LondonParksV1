//
//  MapView.swift
//  LondonParks
//
//  Created by Parsa Shobany on 14/08/2022.
//
import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.502992, longitude: -0.20469),
            span: MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008)
        )
    
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
            region = MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008)
            )
        }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
