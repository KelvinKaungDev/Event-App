//
//  CreatedEventListView.swift
//  Event App
//
//  Created by Akito Daiki on 7/2/2567 BE.
//
import SwiftUI

struct CreatedEventListView: View {
    @Binding var createdEventList: [EventList]
    @ObservedObject var singleEventViewModel = EventViewModel()
    
    @State var eventNames: [String: String] = [:]

    var body: some View {
        if createdEventList.isEmpty{
            Text("You haven't created any events")
        } else {
            List(createdEventList){ event in
                CreatedEventListRow(eventName: event.name)
               
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
//
//#Preview {
//    CreatedEventListView(createdEventList: .constant(["6589b7eeb1549b810c5a7542"]))
//}
//
