//
//  ProfileView.swift
//  Event App
//
//  Created by Akito Daiki on 30/1/2567 BE.
//

import SwiftUI
import Firebase
import FirebaseAuth
import GoogleSignIn
 
struct ProfileView: View {
    @State private var isSignedOut: Bool = false
    @ObservedObject var userViewModel = UserViewModel.shared
    @State private var storedUserId: String = ""
    @State private var username = ""
    @State private var email = ""
    
    var body: some View {
        VStack {
            if !storedUserId.isEmpty {
                Text("User ID: \(storedUserId)")
                    .padding()
                Text("Username: \(username)")
                Text("Email: \(email)")
            }
            Button(action: {
                isSignedOut = true
            }) {
                Text("Sign Out")
                    .padding()
                    .background(.black)
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .padding()
            }
            .alert("Are you sure you want to sign out?", isPresented: $isSignedOut) {
                Button("OK") {
                    UserDefaults.standard.removeObject(forKey: "UserID")
                    do {
                        try Auth.auth().signOut()
                        UserDefaults.standard.set(false, forKey: "signIn")
                        
                    } catch let signOutError as NSError {
                        print("Error signing out: %@", signOutError)
                    }
                }
                Button("Cancel", role: .cancel) {
                    
                }
            }
        }
        .onAppear(perform: {
            if let userId = UserDefaults.standard.string(forKey: "UserID"){
                print("UserID in UserDefaults: \(userId)")
                storedUserId = userId
                userViewModel.fetchSingleUser(userId: userId) { result in
                    switch result {
                    case .success(let user):
                        DispatchQueue.main.async {
                            self.username = user.username
                            print(user.username)
                            self.email = user.email ?? "No Email Found"
                            print(user.email ?? "Email not available")
                        }
                    case .failure(let error):
                        print(error)
                    }
                }
            }else{
                print("No UserID found in UserDefaults.")
                storedUserId = ""
            }
        })
    }
}
 
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
