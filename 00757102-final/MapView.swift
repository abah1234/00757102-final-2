//
//  MapView.swift
//
//
//  Created by 蔡文彬 on 2021/1/6.
//  
//

import Foundation
import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    var coordinate: CLLocationCoordinate2D
    var annotations = [MKPointAnnotation]()
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        let mapView = MKMapView()
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(region, animated: true)
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        
        uiView.removeAnnotations(uiView.annotations)
        
        uiView.addAnnotations(annotations)
        uiView.showAnnotations(annotations, animated: true)
    }
    
    
    
}
