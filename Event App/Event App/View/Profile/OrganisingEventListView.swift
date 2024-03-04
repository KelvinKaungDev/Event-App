//
//  OrganisingEventListView.swift
//  Event App
//
//  Created by Austin Xu on 2024/2/20.
//

import SwiftUI

struct OrganisingEventListView: View {
    @Binding var organisingEventList: [EventList]
    @State var pendingParticipants: [String] = []
    @ObservedObject var singleEventViewModel = EventViewModel()
    
    @State private var eventNames: [String:String] = [:]
    
    var body: some View {
        if organisingEventList.isEmpty{
            Text("You're not Organising any events")
        } else{
            List(organisingEventList){ event in
//                    OrganisingEventRow(eventName: eventName, eventId: eventId, pendingParticipants: pendingParticipants)
                OrganisingEventRow(eventName: event.name, eventId: event.id)
                
            }//End of List
            .navigationTitle("Organising Event List")
            
        }
        
    }
    
    func fetchEventNames(eventId: String){
        DispatchQueue.main.async {
            singleEventViewModel.fetchSingleEvent(eventId: eventId) { result in
                switch result{
                case .success(let event):
                    print(event.pendingParticipantList)
                    self.pendingParticipants = event.pendingParticipantList
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

struct OrganisingEventRow: View{
    
    var eventName: String
    var eventId: String
    @State var pendingParticipants: [String] = []
        
    var body: some View{
        Section{
            NavigationLink {
                AllPendingParticipantsView(pendingParticipantData: self.$pendingParticipants)
            } label: {
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
}

//#Preview {
//    OrganisingEventListView(organisingEventList: .constant(["65892817969238ac81d637b6"]))
//}
