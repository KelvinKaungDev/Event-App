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
                OrganisingEventRow(eventName: event.name, eventId: event.id, orgId: event.creatorId)
            }//End of List
            
            .navigationTitle("Organising Event List")
        }
        
    }
    
}

struct OrganisingEventRow: View{
    
    @State var eventName: String
    @State var eventId: String
    @State var orgId: String
    
    @ObservedObject var vm = EventParticipantViewModel.shared
        
    @State var pending: [Participant] = []
    
    var body: some View{
        Section{
            NavigationLink {
                AllPendingParticipantsView(eventId: $eventId, orgId: $orgId, pendingParticipantData: self.$pending)
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
        .onAppear(perform: {
            vm.getEventByOrgId(orgId: orgId, eventId: eventId) { result in
                switch result{
                case .success(let participants):
                    print("organising workkkssssss")
                    self.pending = participants.pendingParticipantList
                    print(self.pending)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        })
        
    }
}

//#Preview {
//    OrganisingEventListView(organisingEventList: .constant(["65892817969238ac81d637b6"]))
//}
