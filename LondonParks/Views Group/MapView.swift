//
//  MapView.swift
//  Landmarks
//
//  Created by Parsa Shobany on 09/08/2022.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var number : Int = 0
    var latitude: Double {
        return parksData[number].coordinates.latitude
    }
    var longitude: Double {
        return parksData[number].coordinates.longitude
    }
    var zoomLevel: Double = 0.01
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: zoomLevel, longitudeDelta: zoomLevel)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        let parkAnnotation = MKPointAnnotation()
        parkAnnotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        parkAnnotation.title = "🎡🎠\(parksData[number].name)🎢🍭🥨"
        mapView.addAnnotation(parkAnnotation)
    }
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    class Coordinator: NSObject, MKMapViewDelegate {
    }
}


func createMapView(latitude: Double, longitude: Double, zoomLevel: Double) -> MapView {
    return MapView(number: 0, zoomLevel: zoomLevel)
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(number: 0, zoomLevel: 0.01)// Coordinates for San Francisco
    }
}
