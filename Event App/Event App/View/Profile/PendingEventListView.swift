//
//  PendingEventListView.swift
//  Event App
//
//  Created by Akito Daiki on 15/2/2567 BE.
//

import SwiftUI

struct PendingEventListView: View {
    @Binding var pendingEventList: [String]
    @ObservedObject var singleEventViewModel = EventViewModel()
    
    @State var eventNames: [String: String] = [:]
    var body: some View {
        
        if pendingEventList == []{
            Text("There's no pending events right now")
        } else {
            List(pendingEventList, id: \.self){ eventId in
                if let eventName = eventNames[eventId]{
                    PendingEventRow(eventName: eventName)
                } else{
                    ProgressView()
                        .onAppear{
                            fetchEventName(eventId: eventId)
                        }
                }
            }
            .navigationTitle("Pending Event List")

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

struct PendingEventRow: View{
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
    PendingEventListView(pendingEventList: .constant(["6589b7eeb1549b810c5a7542"]))
}
