//
//  OrganisingEventListView.swift
//  Event App
//
//  Created by Austin Xu on 2024/2/20.
//

import SwiftUI

struct OrganisingEventListView: View {
    @Binding var organisingEventList: [String]
    @State var pendingParticipants: [String] = []
    @ObservedObject var singleEventViewModel = EventViewModel()
    
    @State private var eventNames: [String:String] = [:]
    
    var body: some View {
        if organisingEventList == []{
            Text("You're not Organising any events")
        } else{
            List(organisingEventList, id: \.self){ eventId in
                if let eventName = eventNames[eventId]{
                    OrganisingEventRow(eventName: eventName, eventId: eventId, pendingParticipants: pendingParticipants)
                } else{
                    ProgressView()
                        .onAppear{
                            fetchEventNames(eventId: eventId)
                        }
                }
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
    @State var pendingParticipants: [String]
        
    var body: some View{
        Section{
//            NavigationLink(value: eventId){
//                HStack{
//                    Image(systemName: "rectangle.3.group.bubble")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 50)
//                    VStack(alignment: .leading){
//                        Text(eventName)
//                        Text("Description")
//                    }.padding(.horizontal)
//                }
//                .padding()
//            }
//            .navigationDestination(for: String.self) { value in
//                AllPendingParticipantsView(pendingParticipantData: self.$pendingParticipants)
//            }
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

#Preview {
    OrganisingEventListView(organisingEventList: .constant(["65892817969238ac81d637b6"]))
}
