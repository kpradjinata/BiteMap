//
//  ContentView.swift
//  BiteMap
//
//  Created by Kevin Pradjinata on 3/16/24.
//
import SwiftUI
import FirebaseAuth // Import FirebaseAuth


struct ContentView: View {
    @StateObject var authViewModel = AuthViewModel()
    @StateObject var locationManager = LocationManager()

    var body: some View {
        if authViewModel.isUserLoggedIn {
            TabView {
                MainContentView(locationManager: locationManager) // Pass locationManager here
                    .tabItem {
                        Label("Location", systemImage: "location.circle")
                    }

                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.crop.circle")
                    }
            }
        } else {
            LoginView(authViewModel: authViewModel)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


#Preview {
    ContentView()
}
