//
//  LoginView.swift
//  BiteMap
//
//  Created by Kevin Pradjinata on 3/16/24.
//
import FirebaseAuth
import SwiftUI

struct LoginView: View {
    @ObservedObject var authViewModel: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage: String?

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }

            Button("Login") {
                authViewModel.login(email: email, password: password)
            }
            .padding()
        }
        .padding()
    }
}
