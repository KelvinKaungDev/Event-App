//
//  HomeView.swift
//  Event App
//
//  Created by Akito Daiki on 19/1/2567 BE.
//

import SwiftUI
import Firebase
import FirebaseAuth
import GoogleSignIn

struct HomeView: View {
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


//    func getUserIdForEmail(_ email: String) -> String? {
//        if let userCredentials = UserDefaults.standard.dictionary(forKey: "userCredentials") as? [String: String],
//           let savedEmail = userCredentials["email"],
//           let userId = userCredentials["id"], savedEmail == email {
//            return userId
//        }
//        return nil
//    }
    

//struct HomeView: View {
//    @State private var isSignedOut: Bool = false
//    @State private var authentication = Auth.auth()
//    @ObservedObject var userViewModel = UserViewModel.shared
//    @ObservedObject var userPostViewModel = UserPostViewModel()
////    @AppStorage("userID") var userID: String?
//    @State private var userName: String = ""
//    @State private var userEmail: String = ""
//
//    var body: some View {
//        VStack {
//            Text("User Name: \(userName)")
//            Text("Email: \(userEmail)")
//            Button(action: {
//                isSignedOut = true
//            }) {
//                Text("Sign Out")
//                    .padding()
//                    .background(.black)
//                    .cornerRadius(12)
//                    .foregroundColor(.white)
//                    .padding()
//            }
//            .alert("Are you sure you want to sign out?", isPresented: $isSignedOut) {
//                Button("OK") {
//                    do {
//                        try Auth.auth().signOut()
//                        UserDefaults.standard.set(false,forKey: "signIn")
//                    } catch let signOutError as NSError {
//                        print("Error signing out: %@", signOutError)
//                    }
//                }
//                Button("Cancel", role: .cancel) {}
//            }
//        }
//        .onAppear {
//            if let userId = UserDefaults.standard.string(forKey: "userID") {
//                userViewModel.fetchSingleUser(userId: userId) { result in
//                    switch result {
//                    case .success(let user):
////                        self.userName = user.firstName
//                        print(user.firstName)
//                    case .failure(let error):
//                        print("Error fetching user: \(error)")
//                    }
//                }
//            }
//        }
//    }
//    
//    func getUserIdForEmail(_ email: String) -> String? {
//        if let userCredentials = UserDefaults.standard.dictionary(forKey: "userCredentials") as? [String: String],
//           let savedEmail = userCredentials["email"],
//           let userId = userCredentials["id"], savedEmail == email {
//            return userId
//        }
//        return nil
//    }
//
//}
//
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}


// Display Firebase Authentication user details
//            Text("User Name: \(authentication.currentUser?.displayName ?? "No User name found")")
//            Text("Email: \(authentication.currentUser?.email ?? "No Email Found")")
//            Text("Phone Number: \(authentication.currentUser?.phoneNumber ?? "No Phone Number Found")")

// Place to display additional user details from UserViewModel
// You need to modify UserViewModel to support this

//            HStack{
//                UserViewModel.shared.fetchSingleUser(userId: "658927ee969238ac81d637af") { result in
//                    switch result {
//                    case .success(let user):
//                        print(user.firstName)
//                    case .failure(let error):
//                        print(error)
//                    }
//                }
//            }
