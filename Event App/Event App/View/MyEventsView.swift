//
//  MyEventsView.swift
//  Event App
//
//  Created by Akito Daiki on 3/2/2567 BE.
//

import SwiftUI

struct MyEventsView: View {
    
    @ObservedObject var userViewModel = UserViewModel.shared
    @State private var storedUserId: String = ""
    @State private var pendingEventList: [String] = []
    @State private var participatingEventList: [String] = []
    @State private var participatedEventList: [String] = []
    @State private var approvedParticipantList: [String] = []
    @State private var rejectedParticipantList: [String] = []
    
    var body: some View {
        VStack{
            Text("Pending Events: \(pendingEventList.joined(separator: ", "))")
            Text("Participating Events: \(participatingEventList.joined(separator: ", "))")
            Text("Participated Events: \(participatedEventList.joined(separator: ", "))")
            Text("Approved Participants: \(approvedParticipantList.joined(separator: ", "))")
            Text("Rejected Participants: \(rejectedParticipantList.joined(separator: ", "))")
        }
        .onAppear(perform: {
            if let userId = UserDefaults.standard.string(forKey: "UserID"){
                print("UserID in UserDefaults: \(userId)")
                storedUserId = userId
                userViewModel.fetchSingleUser(userId: userId) { result in
                    switch result {
                    case .success(let user):
                        DispatchQueue.main.async {
                            // get the data from api
                            self.pendingEventList = user.pendingEventList ?? ["There is no pending event yet"]
                            self.participatingEventList = user.participatingEventList ?? ["There is no participating event yet"]
                            self.participatedEventList = user.participatedEventList ?? ["There is no participated event yet"]
                            self.approvedParticipantList = user.approvedParticipantList ?? ["There is no approved participant"]
                            self.rejectedParticipantList = user.rejectedParticipantList ?? ["There is no rejected participant"]
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

#Preview {
    MyEventsView()
}
