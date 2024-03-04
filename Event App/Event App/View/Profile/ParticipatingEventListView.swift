//
//  ParticipatingEventListView.swift
//  Event App
//
//  Created by Austin Xu on 2024/2/21.
//

import SwiftUI

struct ParticipatingEventListView: View {
    @Binding var participatingEventList: [EventList]
    @ObservedObject var singleEventViewModel = EventViewModel()
    
    @State var eventNames: [String: String] = [:]
    
    var body: some View {
        if participatingEventList.isEmpty{
            Text("You are not participating in any events")
        }
        else {
            List(participatingEventList) {event in
                ParticipatingEventRow(eventName: event.name)
                
            }
            .navigationTitle("Participating Event List")
            
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

struct ParticipatingEventRow: View{
    var eventName: String
    var body: some View{
        Section {
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
//    ParticipatingEventListView(participatingEventList: .constant([""]))
//}
