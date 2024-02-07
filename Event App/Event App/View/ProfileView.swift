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
import Kingfisher
 
struct ProfileView: View {
    
    @State private var isSignedOut: Bool = false
    @ObservedObject var userViewModel = UserViewModel.shared
    @State private var storedUserId: String = ""
    @State private var username = ""
    @State private var email = ""
    @State private var phoneNumber = 0
    @State private var age = 0
    
    var body: some View {
        NavigationStack{
            ZStack{
                NavigationStack{
                    ZStack {
                        Path { path in
                            //Top left
                            path.move(to: CGPoint(x: 0, y: 0))
                            //Left vertical bound
                            path.addLine(to: CGPoint(x: 0, y: 300))
                            //Curve
                            path.addCurve(to: CGPoint(x: 430, y: 200), control1: CGPoint(x: 175, y: 350), control2: CGPoint(x: 250, y: 80))
                            //Right vertical bound
                            path.addLine(to: CGPoint(x: 450, y: 0))
                        }
                        .fill(
                            LinearGradient(
                                colors: [Color("red_primary"),
                                         Color("red_secondary"),
                                         Color("red_secondary")],
                                startPoint: .top,
                                endPoint: .bottom)
                        )
                        .edgesIgnoringSafeArea(.top)
                        
                        
                        VStack {
                            
                            VStack {
                                
                                if let photoURL = Auth.auth().currentUser?.photoURL {
                                    KFImage(photoURL)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                        .cornerRadius(20)
                                        .padding([.bottom, .trailing], 4)
                                } else {
                                    Text("Nothing to be found")
                                }
                                HStack{
                                    Text(username)
                                        .bold()
                                        .font(.title)
                                }
                                HStack(spacing: 30){
                                    VStack{
                                        Text("\(email)").font(.system(size: 14))
                                        Text("Email")
                                    }.padding()
                                    VStack{
                                        Text("\(age)")
                                        Text("Age")
                                    }.padding()
                                    VStack{
                                        Text("\(String(phoneNumber))")
                                        Text("Phone Number")
                                    }.padding()
                                }
                                Divider()
                                
                                NavigationLink(destination: MyEventsView().navigationTitle("My Events")) {
                                    HStack{
                                        Image(systemName: "calendar")
                                        Text("My Events")
                                        Spacer()
                                        Image(systemName: "arrow.right")
                                    }
                                    .padding()
                                }
                                .tint(.black)
                                
                                Divider()
                            }
                            
                            HStack(spacing: 30){
                                VStack{
                                    Text("326")
                                    Text("Participated")
                                }
                                VStack{
                                    Text("98")
                                    Text("Organized")
                                }
                                VStack{
                                    Text("1020")
                                    Text("On Going")
                                }
                            }
                            Divider()
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
                                    .background(.red)
                                    .cornerRadius(12)
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            .alert("Are you sure you want to sign out?", isPresented: $isSignedOut) {
                                Button("OK") {
                                    UserViewModel.shared.signOutUser(userId: storedUserId) { _ in }
                                    UserDefaults.standard.removeObject(forKey: "UserID")
                                    UserDefaults.standard.removeObject(forKey: "HomeViewUserName")
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
                                            self.phoneNumber = user.phoneNumber
                                            print(user.phoneNumber)
                                            self.age = user.age
                                            print(user.age)
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
                        .toolbar {
                            Button(action: {
                                print("gg")
                            }, label: {
                                Image(systemName: "gearshape")
                                    .foregroundStyle(.black)
                                    .frame(width: 30, height:30)
                            })
                        }
                    }
                }
            }
        }
    }
    
    struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView()
        }
    }
}
