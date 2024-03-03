//
//  EventDetailsView.swift
//  eventsAU
//
//  Created by Swan Nay Phue Aung on 25/12/2023.
//

import SwiftUI

struct EventDetailsView: View {    
    @Binding var event: Events
    
    @Binding var path: [String]
    
    var body: some View {
        
//        VStack(alignment:.center,spacing:15){
        ScrollView(.vertical,showsIndicators: true){
            Image("swiftuihackathon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 360, height: 300)
            VStack(alignment:.leading,spacing:15){
                Text(event.name)
                    .bold()
                    .font(.system(size:25))
                Text(event.location)
                    .fontWeight(.regular)
                    .font(.system(size:18))
                HStack{
                    Text("📆 \(K.dateformatter(date: K.stringToDate(from: event.date)))")
                        .fontWeight(.regular)
                        .font(.system(size:18))
                        .opacity(0.8)
                    Text("⏰ \(K.timeformatter(date: K.stringToDate(from: event.startTime)))Onwards")
                        .fontWeight(.regular)
                        .font(.system(size:18))
                        .opacity(0.8)
                    
                }
                HStack{
                    Image(systemName: "person.crop.circle")
                        .foregroundStyle(.red)
                    
//                        Text(test.participantList)
//                            .foregroundStyle(.red)
                    Text(" \(event.participantList.count)")
                    Text(" attending this event")
                }
                Text("Description")
                    .bold()
                    .font(.system(size:20))
                Text(event.description)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal,20)
            
//            NavigationLink(destination:RegisterEventView(event: $event, path: $path)){
//                RoundedRectangle(cornerRadius: 30)
//                    .foregroundStyle(.red.opacity(0.8))
//                    .frame(width:300,height:50)
//                    .padding()
//                    .shadow(color:.gray,radius: 5,x:5,y:5)
//                    .overlay(
//                        Text("Register Now")
//                            .bold()
//                            .foregroundStyle(.white))
//            }
            NavigationLink(value: "register") {
                RoundedRectangle(cornerRadius: 30)
                    .foregroundStyle(.red.opacity(0.8))
                    .frame(width:300,height:50)
                    .padding()
                    .shadow(color:.gray,radius: 5,x:5,y:5)
                    .overlay(
                        Text("Register Now")
                            .bold()
                            .foregroundStyle(.white)
                    )
            }
            
        } //end of Scroll View
//        .navigationDestination(for: String.self, destination: { value in
//            RegisterEventView(event: $event, path: $path)
//        })
//        

        .navigationTitle("Event Details")
        
    }
}

//
//#Preview {
//    NavigationStack{
//        EventDetailsView(
//            event: .constant(Events(id: "abcd", name: "D*code", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat", units: ["658927e6969238ac81d637ad"], date: "Date.now", startTime: "", endTime: "Date.now", location: "VMS", rules: [], comments: [], isPending: false, isCompleted: false, isApproved: false, isRejected: true, isSuspended: false, isCancelled: false, pendingParticipantList: [], participantList: ["658927ee969238ac81d637af"], organizerList: ["658927ee969238ac81d637af"], creatorID: "658927ee969238ac81d637af", createdAt: "", updatedAt: "", v: 0)))
//    }
//}

