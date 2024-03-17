//
//  AuthViewModel.swift
//  BiteMap
//
//  Created by Kevin Pradjinata on 3/16/24.
//
import SwiftUI
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var isUserLoggedIn = false

    init() {
        setupAuthListener()
    }

    func setupAuthListener() {
        Auth.auth().addStateDidChangeListener { [weak self] (auth, user) in
            DispatchQueue.main.async {
                self?.isUserLoggedIn = user != nil
            }
        }
    }

    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if let error = error {
                // Handle the login error
                print("Login error: \(error.localizedDescription)")
            }
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    func checkAuthStatus() {
        isUserLoggedIn = Auth.auth().currentUser != nil
    }

}
