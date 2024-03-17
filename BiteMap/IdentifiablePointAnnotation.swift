//
//  IdentifiablePointAnnotation.swift
//  BiteMap
//
//  Created by Kevin Pradjinata on 3/17/24.
//

import SwiftUI
import MapKit

// Define a custom annotation that conforms to Identifiable
struct IdentifiablePointAnnotation: Identifiable {
    let id = UUID() // Conformance to Identifiable
    var coordinate: CLLocationCoordinate2D
}

struct CustomMapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011286, longitude: -116.166868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )

    // Use the custom IdentifiablePointAnnotation
    let annotations = [
        IdentifiablePointAnnotation(coordinate: CLLocationCoordinate2D(latitude: 34.011286, longitude: -116.166868))
    ]

    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: annotations) { annotation in
            MapPin(coordinate: annotation.coordinate, tint: .red)
        }
    }
}
