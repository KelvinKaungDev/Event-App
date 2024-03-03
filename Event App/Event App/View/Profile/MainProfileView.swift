//
//  SwiftUIView.swift
//  Event App
//
//  Created by Austin Xu on 2024/2/20.
//

import SwiftUI
import Kingfisher
import FirebaseAuth

enum eventListType{
    case organizedEventList
    case organisingEventList
    case participatedEventList
    case ptingEventList
    case pendingEventList
    case createdEventList

}

struct MainProfileView: View {
    @State var eventData: Events = Events(id: "abcd", name: "Music Festival", description: "Coding Club", units: ["658927e6969238ac81d637ad"], date: "", startTime: "", endTime:" Date.now", location: "VMS", rules: [], comments: [], isPending: false, isCompleted: false, isApproved: true, isRejected: false, isSuspended: false, isCancelled: false, pendingParticipantList: ["658927ee969238ac81d637af"], participantList: [], organizerList: ["658927ee969238ac81d637af"], creatorID: "658927ee969238ac81d637af", createdAt: "", updatedAt: "", v: 0)
    
    @ObservedObject var userViewModel = UserViewModel.shared
    @State var username: String = ""
    @State private var isSignedOut: Bool = false
    
    @State private var storedUserId: String = ""
    @State private var organizedEventList: [String] = []
    @State private var organisingEventList: [String] = []
    @State private var participatedEventList: [String] = []
    @State private var participatingEventList: [String] = []
    @State private var pendingEventList: [String] = []
    @State private var createdEventList: [String] = []


    var body: some View {
        NavigationStack{
            ZStack{
                GeometryReader{ geometry in
                    Path { path in
                        //Top left
                        path.move(to: CGPoint(x: 0, y: 0))
                        path.addLine(to: CGPoint(x: 0, y: 450))
                        path.addLine(to: CGPoint(x: geometry.size.width, y: 450))
                        path.addLine(to: CGPoint(x: geometry.size.width, y: 0))
                        path.addLine(to: CGPoint(x: 0, y: 0))
                    }
                    .fill(
                        LinearGradient(
                            colors: [Color("profile_color_two").opacity(0.5),
                                     Color("profile_color_one").opacity(0.5),
                                     Color("profile_color_one").opacity(0.5)
                                     ],
                            startPoint: .top,
                            endPoint: .bottom)
                    )
                    .edgesIgnoringSafeArea(.top)
                    Path{ path in
                        path.move(to: CGPoint(x: 0, y: 400))
                        path.addLine(to: CGPoint(x: 0, y: 1000))
                        path.addLine(to: CGPoint(x: geometry.size.width, y: 1000))
                        path.addLine(to: CGPoint(x: geometry.size.width, y: 450))
                        path.addLine(to: CGPoint(x: 0, y: 450))

    //                    path.addLine(to: CGPoint(x: geometry.size.width, y: 450))
    //                    path.addLine(to: CGPoint(x: geometry.size.width, y: 0))
    //                    path.addLine(to: CGPoint(x: 0, y: 0))
                    }
                    .fill(Color("grey_background"))
                }.ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                VStack(alignment: .center){
                    if let photoURL = Auth.auth().currentUser?.photoURL {
                        KFImage(photoURL)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 130, height: 130)
                            .clipShape(Circle())
                            .cornerRadius(20)
                            .shadow(color: .black, radius: 5, x:5, y:5)
                            .padding([.bottom, .trailing], 4)
                    } else {
                        Circle()
                            .scaledToFit()
                            .frame(width: 130, height: 130)
                            .clipShape(Circle())
                            .cornerRadius(20)
                            .shadow(color: .black, radius: 5, x:5, y:5)
                            .padding([.bottom, .trailing], 4)
                    }
                    
                    Text(Auth.auth().currentUser?.displayName ?? "No Username Found")
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundStyle(.white)
                        .padding(.vertical)
                        
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 200, height: 50)
                        .foregroundStyle(Color("customPink").opacity(0.6))
                        .overlay(
                            Text(Auth.auth().currentUser?.email ?? "No Email Found")
                                .foregroundStyle(.white)
                                .tint(.white)
                        )
                    List{
                        NavigationLink(value: eventListType.organizedEventList) {
                            HStack{
                                Image(systemName: "shared.with.you")
                                Spacer().frame(width: 20)
                                Text("Organized Event List")
                            }.padding(.vertical, 5)
                        }
                        NavigationLink(value: eventListType.organisingEventList) {
                            HStack{
                                Image(systemName: "shared.with.you")
                                Spacer().frame(width: 20)
                                Text("Organising Event List")
                            }.padding(.vertical, 5)
                        }
                        
                        NavigationLink(value: eventListType.participatedEventList) {
                            HStack{
                                Image(systemName: "rectangle.center.inset.filled")
                                Spacer().frame(width: 20)
                                Text("Participated Event List")
                            }.padding(.vertical, 5)
                        }
                        
                        NavigationLink(value: eventListType.ptingEventList) {
                            HStack{
                                Image(systemName: "rectangle.center.inset.filled")
                                Spacer().frame(width: 20)
                                Text("Participating Event List")
                            }.padding(.vertical, 5)
                        }
                        
                        NavigationLink(value: eventListType.pendingEventList) {
                            HStack{
                                Image(systemName: "clock.arrow.circlepath")
                                Spacer().frame(width: 20)
                                Text("Pending Event List")
                            }.padding(.vertical, 5)
                        }
                        NavigationLink(value: eventListType.createdEventList) {
                            HStack{
                                Image(systemName: "clock")
                                Spacer().frame(width: 20)
                                Text("Created Event List")
                            }.padding(.vertical, 5)
                        }
                        
                    }.scrollContentBackground(.hidden)
                    
                    Spacer()
                    
                }
                .navigationDestination(for: eventListType.self) { type in
                    switch type{
                        
                    case .ptingEventList:
                        ParticipatingEventListView(participatingEventList: self.$participatingEventList)
//                        ParticipatingEventListView(participatingEventList: self.$participatingEventList)
                        
                    case .organizedEventList:
                        OrganizedEventListView(organizedEventList: self.$organizedEventList)
                        
                    case .organisingEventList:
                        OrganisingEventListView(organisingEventList: self.$organisingEventList)
                        
                    case .participatedEventList:
                        ParticipatedEventListView(participatedEventList: self.$participatedEventList)
                        
                    case .pendingEventList:
                        PendingEventListView(pendingEventList: self.$pendingEventList)
                        
                    case .createdEventList:
                        CreatedEventListView(createdEventList: self.$createdEventList)
                    }
                }
                
            }
            
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isSignedOut = true
                    }, label: {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                            .foregroundStyle(.white)
                    })
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
            })
        }
        .onAppear{
//            userViewModel.fetchSingleUser(userId: "658927ee969238ac81d637af") { result in
//                switch result{
//                case .success(let user):
//                    self.organizedEventList = user.organizedEventList ?? []
//                    self.organisingEventList = user.organisingEventList ?? []
//                    self.participatedEventList = user.participatedEventList ?? []
//                    self.participatingEventList = user.participatingEventList ?? []
//                    self.pendingEventList = user.pendingEventList ?? []
//                    self.createdEventList = user.createdEventList ?? []
//                    
//                    
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//            }
            
            if let userId = UserDefaults.standard.string(forKey: "UserID") {
                storedUserId = userId
                userViewModel.fetchSingleUser(userId: storedUserId) { result in
                    switch result{
                    case .success(let user):
                        self.organizedEventList = user.organizedEventList ?? []
                        self.organisingEventList = user.organisingEventList ?? []
                        self.participatedEventList = user.participatedEventList ?? []
                        self.participatingEventList = user.participatingEventList ?? []
                        self.pendingEventList = user.pendingEventList ?? []
                        self.createdEventList = user.createdEventList ?? []
                        
                        
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }

        
    }
}

#Preview {
    MainProfileView()
}
