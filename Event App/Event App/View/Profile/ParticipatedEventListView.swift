//
//  ParticipatedEventListView.swift
//  Event App
//
//  Created by Akito Daiki on 15/2/2567 BE.
//

import SwiftUI

struct ParticipatedEventListView: View {
    @Binding var participatedEventList: [EventList]
    @ObservedObject var singleEventViewModel = EventViewModel()
    
    @State private var eventNames: [String: String] = [:]
    
    var body: some View {
        if participatedEventList.isEmpty{
            Text("You haven't participated in any events")
        } else {
            List(participatedEventList){ event in
                ParticipatedEventRow(eventName: event.name)

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


//#Preview {
//    ParticipatedEventListView(participatedEventList: .constant(["6589b7eeb1549b810c5a7542"]))
//}
