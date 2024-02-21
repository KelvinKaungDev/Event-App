////
////  ParticipatedEventListView.swift
////  Event App
////
////  Created by Akito Daiki on 15/2/2567 BE.
////
//
import SwiftUI
//
//struct ParticipatedEventListView: View {
//    @ObservedObject var viewModel = UserViewModel.shared
//    @ObservedObject var eventsViewModel = EventViewModel()
//    @State private var storedUserId: String = ""
//    @State var participatedEventList: [Events] = []
//    
//    var body: some View {
//        
//        
//        ScrollView(.horizontal,showsIndicators: false){
//            HStack(spacing:15){
//                ForEach(participatedEventList, id:\.id) { event in
//                    EventCardView(event: .constant(event))
//                }
//            }
//        }
//        
//        
//        
//        
//        
////        List(participatedEventList, id: \.id) { event in
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
//                            self.participatedEventList = populateEventList.participatedEventList ?? []
//                        case .failure(let error):
//                            print("participated error")
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
//#Preview {
//    ParticipatedEventListView()
//}

struct ParticipatedEventListView: View {
    @Binding var participatedEventList: [String]
    @ObservedObject var singleEventViewModel = EventViewModel()
    
    @State private var eventNames: [String: String] = [:]
    
    var body: some View {
        if participatedEventList == []{
            Text("You haven't participated in any events")
        } else {
            List(participatedEventList, id: \.self){ eventId in
                if let eventName = eventNames[eventId]{
                    ParticipatedEventRow(eventName: eventName)
                } else{
                    ProgressView()
                        .onAppear{
                            fetchEventName(eventId: eventId)
                        }
                }
            }.navigationTitle("Participated Event List")
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

struct ParticipatedEventRow: View{
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
    ParticipatedEventListView(participatedEventList: .constant(["6589b7eeb1549b810c5a7542"]))
}
