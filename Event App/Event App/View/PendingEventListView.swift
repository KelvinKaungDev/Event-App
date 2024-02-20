//
//  PendingEventListView.swift
//  Event App
//
//  Created by Akito Daiki on 15/2/2567 BE.
//

import SwiftUI

struct PendingEventListView: View {
    @ObservedObject var viewModel = UserViewModel.shared
    @ObservedObject var eventsViewModel = EventViewModel()
    @State private var storedUserId: String = ""
    @State var pendingEventList: [Events] = []
    
    var body: some View {
        
        
        ScrollView(.horizontal,showsIndicators: false){
            HStack(spacing:15){
                ForEach(pendingEventList, id:\.id) { event in
                    EventCardView(event: .constant(event))
                }
            }
        }
        
        
        
        
//        List(pendingEventList, id: \.id) { event in
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
                            self.pendingEventList = populateEventList.pendingEventList ?? []
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
    PendingEventListView()
}
