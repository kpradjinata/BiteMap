//
//  MapView.swift
//  BiteMap
//
//  Created by Kevin Pradjinata on 3/17/24.
//
//
//  MapView.swift
//  BiteMap
//
//  Created by Kevin Pradjinata on 3/17/24.
//

//
//  MapView.swift
//  BiteMap
//
//  Created by Kevin Pradjinata on 3/17/24.
//
import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject var locationManager: LocationManager // Ensure this is correctly instantiated where MapView is used.
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), // Default center: San Francisco
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05) // Default zoom level
    )

    var body: some View {
        Map(coordinateRegion: $region,
            showsUserLocation: true)
            .onAppear {
                // Directly call the function on locationManager without trying to access it as a property
                locationManager.requestLocationAuthorization()
                updateRegionToCurrentLocation()
            }
    }

    private func updateRegionToCurrentLocation() {
        // Safely unwrap currentLocation or directly use it if your locationManager ensures it's non-nil when needed
        if let currentLocation = locationManager.currentLocation {
            // Update the state variable directly
            region = MKCoordinateRegion(
                center: currentLocation,
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
        }
    }
}

