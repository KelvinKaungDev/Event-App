//
//  ParticipatingEventList.swift
//  Event App
//
//  Created by Akito Daiki on 15/2/2567 BE.
//

import SwiftUI

struct ParticipatingEventListView: View {
    @ObservedObject var viewModel = UserViewModel.shared
    @ObservedObject var eventsViewModel = EventViewModel()
    @State private var storedUserId: String = ""
    @State var participatingEventList: [Events] = []
    
    var body: some View {
        
        
        
        ScrollView(.horizontal,showsIndicators: false){
            HStack(spacing:15){
                ForEach(participatingEventList, id:\.id) { event in
                    EventCardView(event: .constant(event))
                }
            }
        }
        
        
//        List(participatingEventList, id: \.id) { event in
//            VStack(alignment: .leading) {
//                Text(event.name)
//                    .font(.headline)
//                Text(event.description)
//                    .font(.subheadline)
//            }
//        }
        .onAppear {
            if let userId = UserDefaults.standard.string(forKey: "UserID"){
                storedUserId = userId
                //                    DispatchQueue.main.async {
                //                        eventsViewModel.loadEvents(userId: userId)
                viewModel.fetchUserPopulateEventList(userId: userId) { result in
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let populateEventList):
                            self.participatingEventList = populateEventList.participatingEventList ?? []
                        case .failure(let error):
                            print(error)
                        }
                    }
                }
                //                    }
            } else {
                print("Error gg HAS")
            }
        }
    }
}

#Preview {
    ParticipatingEventListView()
}
