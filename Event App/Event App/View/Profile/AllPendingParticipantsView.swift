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
    
    @Binding var pendingParticipantData: [String]
    @ObservedObject var userViewModel = UserViewModel.shared
    @State private var usernames: [String: String] = [:]

    
    var body: some View {
        List(pendingParticipantData, id: \.self) { participantId in
            if let username = usernames[participantId] {
                PendingParticipantRow(username: username)
                
            } else {
                ProgressView() // Show loading indicator while fetching username
                    .onAppear {
                        // Fetch username asynchronously
                        fetchUsername(for: participantId)
                    }
            }
            
        } // End of list
        
        .navigationTitle("Pending participants")
        
    }
    
    func fetchUsername(for participantId: String) {
            // Fetch username for the participantId asynchronously
            DispatchQueue.main.async {
                userViewModel.fetchSingleUser(userId: participantId) { result in
                    switch result{
                    case .success(let user):
                        self.usernames[participantId] = user.firstName
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
                
            }
        }
        
}
    
struct PendingParticipantRow: View {
    let username: String
    
    var body: some View {
        // Your row view with fetched username
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

#Preview {
    AllPendingParticipantsView(pendingParticipantData: .constant(["658928af969238ac81d637c3","658927ee969238ac81d637af","65c26f0b15bb676caeb20a79"]))
}





