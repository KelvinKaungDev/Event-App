//
//  AllPendingParticipantsView.swift
//  Event App
//
//  Created by Swan Nay Phue Aung on 19/02/2024.
//

import SwiftUI
import Kingfisher
import FirebaseAuth
import Alamofire


struct AllPendingParticipantsView: View {
    @Binding var participantData: Events
    @ObservedObject var userViewModel = UserViewModel.shared
    @State var username: String = ""

    var body: some View {
        NavigationView{
            ScrollView(.vertical,showsIndicators:false){
                ForEach(participantData.pendingParticipantList,id:\.self){pendingParticipant in
                    HStack(spacing:15){
                        
                        if let photoURL = Auth.auth().currentUser?.photoURL {
                            KFImage(photoURL)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .cornerRadius(20)
                                .shadow(color: .white, radius: 5, x:5, y:5)
                                .padding()
                        } else {
                            Image(systemName:"person.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .cornerRadius(20)
                                .shadow(color: .white, radius: 5, x:5, y:5)
                                .padding()
                        }
                        
                        VStack(alignment:.leading,spacing:5) {
                            
                            Text(username)
                                .bold()
                                .font(.system(size:25))
                            
                            
                            
                            
                            HStack(alignment:.top,spacing:5){
                                
                                
                                
                                NavigationLink(destination: NewProfileView()) {
                                    Text("Details")
                                        .foregroundStyle(.white)
                                        .padding()
                                        .background(Color.red.opacity(0.75)
                                            .frame(height:40)
                                            .cornerRadius(6)
                                            .shadow(color:.gray,radius:5)
                                                    
                                        )
                                }
                                
                                Button(action: {}, label: {
                                    Text("Approve")
                                        .foregroundStyle(.white)
                                        .padding()
                                        .background(Color.red.opacity(0.75)
                                            .frame(height:40)
                                            .cornerRadius(6)
                                            .shadow(color:.gray,radius:5)
                                                    
                                        )
                                    
                                })
                                
                                
                            }
                            
                            
                        } //end of VStack
                        
                    } //end of whole HStack
                    .onAppear(perform: {
                        print(pendingParticipant)
                        self.userViewModel.fetchSingleUser(userId: pendingParticipant) { result in
                            switch result{
                            case .success(let user):
                                username = user.firstName
                            case .failure(let error):
                                print(error)
                            }
                        }
                    })
                    
//                                    .onAppear(perform: {
//                    ////                    if let userId = UserDefaults.standard.string(forKey: "UserID"){
//                    ////                        print("UserID in UserDefaults: \(userId)")
//                    ////                        storedUserId = userId
//                                        userViewModel.fetchUserPopulateUnit(userId: pendingParticipant) { result in
//                                            switch result {
//                                            case .success(let user):
//                                                participantData = user
//                    
//                                            case .failure(let error):
//                                                print(error)
//                                            }
//                                        }
//                                            })
                    
                    
                    
                    Divider()
                }
                
            }
        }
        }
    }
    
    
    
    
    

#Preview {
    AllPendingParticipantsView(participantData: .constant(Events(id: "abcd", name: "Music Festival", description: "Coding Club", units: ["658927e6969238ac81d637ad"], date: "", startTime: "", endTime:" Date.now", location: "VMS", rules: [], comments: [], isPending: false, isCompleted: false, isApproved: true, isRejected: false, isSuspended: false, isCancelled: false, pendingParticipantList: ["658927ee969238ac81d637af"], participantList: [], organizerList: ["658927ee969238ac81d637af"], creatorID: "658927ee969238ac81d637af", createdAt: "", updatedAt: "", v: 0)))
}





