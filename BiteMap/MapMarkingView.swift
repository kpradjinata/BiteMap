//
//  MapMarkingView.swift
//  BiteMap
//
//  Created by Kevin Pradjinata on 3/16/24.
//


import SwiftUI
import MapKit
import CoreLocation


struct MapMarkingView: View {
    @ObservedObject var locationManager: LocationManager
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.052235, longitude: -118.243683),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @State private var userTrackingMode = MapUserTrackingMode.follow

    var body: some View {
        Map(coordinateRegion: $region, userTrackingMode: $userTrackingMode)
            .onAppear {
                region = locationManager.region // Set initial region to user's current location
            }
    }
}



struct AnnotatedItem: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}
