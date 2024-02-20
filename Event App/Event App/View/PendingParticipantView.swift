////
////  PendingParticipantView.swift
////  Event App
////
////  Created by Swan Nay Phue Aung on 19/02/2024.
////
//
//import SwiftUI
//import FirebaseAuth
//import Kingfisher
//
//struct PendingParticipantView: View {
////    @Binding var pendingParticipant: Events
//
//    var body: some View {
//        
//    
//        
//        HStack(spacing:15){
//            
//            
//          
//            
//            if let photoURL = Auth.auth().currentUser?.photoURL {
//                KFImage(photoURL)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 80, height: 80)
//                    .clipShape(Circle())
//                    .cornerRadius(20)
//                    .shadow(color: .white, radius: 5, x:5, y:5)
//                    .padding()
//            } else {
//                Image(systemName:"person.circle.fill")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 80, height: 80)
//                    .clipShape(Circle())
//                    .cornerRadius(20)
//                    .shadow(color: .white, radius: 5, x:5, y:5)
//                    .padding()
//            }
//            
//            VStack(alignment:.leading,spacing:5) {
//                let userName =   pendingParticipant.
//                    Text(userName)
//                        .bold()
//                        .font(.system(size:25))
//                    
//                    
////                } else {
////                    Text("User")
////                        .bold()
////                        .font(.system(size:25))
////                    
////                }
//                
//                
//                HStack(alignment:.top,spacing:5){
//                    
//                    Button(action: {}, label: {
//                        Text("Details")
//                            .foregroundStyle(.white)
//                            .padding()
//                            .background(Color.red.opacity(0.75)
//                                .frame(height:40)
//                                .cornerRadius(6)
//                                .shadow(color:.gray,radius:5)
//                            
//                            )
//                           
//                    })
//                    Button(action: {}, label: {
//                        Text("Approve")
//                            .foregroundStyle(.white)
//                            .padding()
//                            .background(Color.red.opacity(0.75)
//                                .frame(height:40)
//                                .cornerRadius(6)
//                                .shadow(color:.gray,radius:5)
//                            
//                            )
//                           
//                    })
//                    
//                    
//                }
//                
//                
//            } //end of VStack
//            
//        } //end of whole HStack
//        Divider()
//        
//    }
//}
//
//#Preview {
//    PendingParticipantView(pendingParticipant: .constant(Events(id: "abcd", name: "Music Festival", description: "Coding Club", units: ["658927e6969238ac81d637ad"], date: "", startTime: "", endTime:" Date.now", location: "VMS", rules: [], comments: [], isPending: false, isCompleted: false, isApproved: false, isRejected: true, isSuspended: false, isCancelled: false, pendingParticipantList: ["658928af969238ac81d637c3","658927ee969238ac81d637af","65c26f0b15bb676caeb20a79"], participantList: [], organizerList: ["658927ee969238ac81d637af"], creatorID: "658927ee969238ac81d637af", createdAt: "", updatedAt: "", v: 0)))
//}
