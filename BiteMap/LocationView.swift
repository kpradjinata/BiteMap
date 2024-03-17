//
//  LocationView.swift
//  BiteMap
//
//  Created by Kevin Pradjinata on 3/16/24.
//

import SwiftUI
import CoreLocation // Import CoreLocation for CLLocationCoordinate2D
import MapKit // Import MapKit for Map view

struct LocationView: View {
    var coordinate: CLLocationCoordinate2D

    var body: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: coordinate, latitudinalMeters: 500, longitudinalMeters: 500)))
    }
}
