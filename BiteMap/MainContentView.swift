//
//  MainContentView.swift
//  BiteMap
//
//  Created by Kevin Pradjinata on 3/16/24.
//

import SwiftUI


struct MainContentView: View {
    @ObservedObject var locationManager: LocationManager
    init(locationManager: LocationManager) {
        self.locationManager = locationManager
    }
    var body: some View {
        MapView(locationManager: locationManager)
    }
}
