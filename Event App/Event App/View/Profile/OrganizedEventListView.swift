//
//  OrganizedEventListView.swift
//  Event App
//
//  Created by Akito Daiki on 15/2/2567 BE.
//

import SwiftUI

//struct OrganizedEventListView: View {
//    
//    @ObservedObject var viewModel = UserViewModel.shared
//    @ObservedObject var eventsViewModel = EventViewModel()
//    @State private var storedUserId: String = ""
//    @State var organizedEventList: [Events] = []
//    
//    var body: some View {
//        List(organizedEventList, id: \.id) { event in
//            VStack(alignment: .leading) {
//                Text(event.name)
//                    .font(.headline)
//                Text(event.description)
//                    .font(.subheadline)
//            }
//        }
//        .onAppear {
//            if let userId = UserDefaults.standard.string(forKey: "UserID"){
//                storedUserId = userId
//                //                    DispatchQueue.main.async {
//                //                        eventsViewModel.loadEvents(userId: userId)
//                viewModel.fetchUserPopulateEventList(userId: userId) { result in
//                    DispatchQueue.main.async {
//                        switch result {
//                        case .success(let populateEventList):
//                            self.organizedEventList = populateEventList.organizedEventList ?? []
//                        case .failure(let error):
//                            print(error)
//                        }
//                    }
//                }
//                //                    }
//            } else {
//                print("Error gg HAS")
//            }
//        }
//    }
//}


struct OrganizedEventListView: View {
    @Binding var organizedEventList: [String]
    @ObservedObject var singleEventViewModel = EventViewModel()
    
    @State private var eventNames: [String:String] = [:]
    
    var body: some View {
        if organizedEventList == []{
            Text("You're not Organising any events")
        } else{
            List(organizedEventList, id: \.self){ eventId in
                if let eventName = eventNames[eventId]{
                    OrganizedEventRow(eventName: eventName)
                } else{
                    ProgressView()
                        .onAppear{
                            fetchEventNames(eventId: eventId)
                        }
                }
            }//End of List
            .navigationTitle("Organized Event List")
        }
        
    }
    
    func fetchEventNames(eventId: String){
        DispatchQueue.main.async {
            singleEventViewModel.fetchSingleEvent(eventId: eventId) { result in
                switch result{
                case .success(let event):
                    self.eventNames[eventId] = event.name
                case .failure(let error):
                    print("organising error")
                    print(error.localizedDescription)
                    print("-------")
                }
            }
        }
    }
}

struct OrganizedEventRow: View{
    var eventName: String
    var body: some View{
        Section{
            HStack{
                Image(systemName: "rectangle.3.group.bubble")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
                VStack(alignment: .leading){
                    Text(eventName)
                    Text("Description")
                }.padding(.horizontal)
            }
            .padding()
        }
    }
}

#Preview {
    OrganizedEventListView(organizedEventList: .constant(["65892817969238ac81d637b6"]))
}
