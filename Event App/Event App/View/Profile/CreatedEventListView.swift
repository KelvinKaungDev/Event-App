//
//  CreatedEventListView.swift
//  Event App
//
//  Created by Akito Daiki on 7/2/2567 BE.
//
import SwiftUI

//struct CreatedEventListView: View {
//    
//    @ObservedObject var viewModel = UserViewModel.shared
//    @ObservedObject var eventsViewModel = EventViewModel()
//    @State private var storedUserId: String = ""
//    @State var createdEventList: [Events] = []
//    
//    var body: some View {
//        
//        
//        
//        ScrollView(.horizontal,showsIndicators: false){
//            HStack(spacing:15){
//                ForEach(createdEventList, id:\.id) { event in
//                    EventCardView(event: .constant(event))
//                }
//            }
//        }
//        
//        
//        
//        
//        
//        
//        
////        List(createdEventList, id: \.id) { event in
////            VStack(alignment: .leading) {
////                Text(event.name)
////                    .font(.headline)
////                Text(event.description)
////                    .font(.subheadline)
////            }
////        }
//        .onAppear {
//            if let userId = UserDefaults.standard.string(forKey: "UserID"){
//                storedUserId = userId
//                //                    DispatchQueue.main.async {
//                //                        eventsViewModel.loadEvents(userId: userId)
//                viewModel.fetchUserPopulateEventList(userId: userId) { result in
//                    DispatchQueue.main.async {
//                        switch result {
//                        case .success(let populateEventList):
//                            self.createdEventList = populateEventList.createdEventList ?? []
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
//
//
//#Preview {
//    CreatedEventListView()
//}

struct CreatedEventListView: View {
    @Binding var createdEventList: [String]
    @ObservedObject var singleEventViewModel = EventViewModel()
    
    @State var eventNames: [String: String] = [:]

    var body: some View {
        if createdEventList == [] {
            Text("You haven't created any events")
        } else {
            List(createdEventList, id: \.self){ eventId in
                if let eventName = eventNames[eventId]{
                    CreatedEventListRow(eventName: eventName)
                } else{
                    ProgressView()
                        .onAppear{
                            fetchEventName(eventId: eventId)
                        }
                }
            }
            .navigationTitle("Created Event List")
            
        }
    }
    
    
    func fetchEventName(eventId: String){
        DispatchQueue.main.async {
            singleEventViewModel.fetchSingleEvent(eventId: eventId) { result in
                switch result{
                case .success(let event):
                    self.eventNames[eventId] = event.name
                case .failure(let error):
                    print("participated error")
                    print(error.localizedDescription)
                    print("-------")
                    
                }
            }
        }
    }
}

struct CreatedEventListRow: View{
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
            }.padding()
            
        }
    }
}

#Preview {
    CreatedEventListView(createdEventList: .constant(["6589b7eeb1549b810c5a7542"]))
}

