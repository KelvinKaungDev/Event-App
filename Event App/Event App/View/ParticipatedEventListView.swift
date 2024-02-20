//
//  ParticipatedEventListView.swift
//  Event App
//
//  Created by Akito Daiki on 15/2/2567 BE.
//

import SwiftUI

struct ParticipatedEventListView: View {
    @ObservedObject var viewModel = UserViewModel.shared
    @ObservedObject var eventsViewModel = EventViewModel()
    @State private var storedUserId: String = ""
    @State var participatedEventList: [Events] = []
    
    var body: some View {
        
        
        ScrollView(.horizontal,showsIndicators: false){
            HStack(spacing:15){
                ForEach(participatedEventList, id:\.id) { event in
                    EventCardView(event: .constant(event))
                }
            }
        }
        
        
        
        
        
//        List(participatedEventList, id: \.id) { event in
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
                            self.participatedEventList = populateEventList.participatedEventList ?? []
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
    ParticipatedEventListView()
}
