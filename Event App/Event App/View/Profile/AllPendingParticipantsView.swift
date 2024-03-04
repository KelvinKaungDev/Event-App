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
    
    @Binding var eventId: String
    @Binding var orgId: String
    @Binding var pendingParticipantData: [Participant]
    @State private var usernames: [String: String] = [:]
    @State var orgAcceptVM = OrgAcceptViewModel.shared

    
    var body: some View {
        if pendingParticipantData.isEmpty{
            Text("There's no pending participants right now.")
        }
        List{
            ForEach(pendingParticipantData, id: \.id){participant in
//                PendingParticipantRow(username: participant.username)
                PendingParticipantRow(id: participant.id,username: participant.username)
            }
        }
        
        .listStyle(.insetGrouped)
//        List(pendingParticipantData, id: \.id) { participant in
//        } // End of list

        .navigationTitle("Pending participants")
        
    }
    
    @ViewBuilder
    func PendingParticipantRow(id: String, username: String) -> some View{
        HStack(spacing: 15){
            Image("pendingParticipant_photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(width: 100, height: 100)
            Spacer().frame(width: 10)
            VStack(alignment: .leading){
                Text(username)
                    .fontWeight(.semibold)
                    .font(.system(size:15))
                Text("Description")
                    .font(.body)
                    .opacity(0.5)
                HStack(alignment:.center){
                    
                    Button(action: {
                        print("approve button works")
                        
                        orgAcceptVM.acceptParticipant(orgId: orgId, eventId: eventId, participantId: id)
                    }, label: {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 80, height: 30)
                            .opacity(0.75)
                            .overlay {
                                Text("Approve")
                                    .font(.system(size: 15))
                                    .foregroundStyle(.white)
                            }
                    })
                    .buttonStyle(.plain)
                    
                    Button(action: {
                        print("reject button works")
                    }, label: {
                        Text("Reject")
                            .foregroundStyle(.red.opacity(0.75))
                            
                    })
                }
            }
        }
    }
        
}
    
//struct PendingParticipantRow: View {
//    let username: String
//    
//    var body: some View {
//        // Your row view with fetched username
//        HStack(spacing: 15){
//            Image("pendingParticipant_photo")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .clipShape(Circle())
//                .frame(width: 100, height: 100)
//            Spacer().frame(width: 10)
//            VStack(alignment: .leading){
//                Text(username)
//                    .fontWeight(.semibold)
//                    .font(.system(size:15))
//                Text("Description")
//                    .font(.body)
//                    .opacity(0.5)
//                HStack(alignment:.center){
//                    
//                    Button(action: {
//                        print("approve button works")
//                    }, label: {
//                        RoundedRectangle(cornerRadius: 5)
//                            .frame(width: 80, height: 30)
//                            .opacity(0.75)
//                            .overlay {
//                                Text("Approve")
//                                    .font(.system(size: 15))
//                                    .foregroundStyle(.white)
//                            }
//                    })
//                    .buttonStyle(.plain)
//                    
//                    Button(action: {
//                        print("reject button works")
//                    }, label: {
//                        Text("Reject")
//                            .foregroundStyle(.red.opacity(0.75))
//                            
//                    })
//                }
//            }
//        }
//        
//        
//        
//    }
//}
//
//#Preview {
//    AllPendingParticipantsView(pendingParticipantData: .constant(["658928af969238ac81d637c3","658927ee969238ac81d637af","65c26f0b15bb676caeb20a79"]))
//}





