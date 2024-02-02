//
//  EventDetailsView.swift
//  eventsAU
//
//  Created by Swan Nay Phue Aung on 25/12/2023.
//

import SwiftUI

struct EventDetailsView: View {    
    @Binding var test: Events
        
    var body: some View {
        
        VStack(alignment:.leading,spacing:15){
            Image("swiftuihackathon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: 317)
            ScrollView(.vertical,showsIndicators: true){
                VStack(alignment:.leading,spacing:15){
                    Text(test.name)
                        .bold()
                        .font(.system(size:25))
                    Text(test.location)
                        .fontWeight(.regular)
                        .font(.system(size:18))
                    HStack{
                        Text("📆 \(K.dateformatter(date: test.date))")
                            .fontWeight(.regular)
                            .font(.system(size:18))
                            .opacity(0.8)
                        Text("⏰ \(K.timeformatter(date: test.startTime)) Onwards")
                            .fontWeight(.regular)
                            .font(.system(size:18))
                            .opacity(0.8)
                        
                    }
                    HStack{
                        Image(systemName: "person.crop.circle")
                            .foregroundStyle(.red)
                        
//                        Text(test.participantList)
//                            .foregroundStyle(.red)
                        Text(" \(test.participantList.count)")
                        Text(" attending this event")
                        
                    }
                    Text("Description")
                        .bold()
                        .font(.system(size:20))
                    Text(test.description)
                    
                }
                
            } //end of Scroll View
            .padding(.horizontal)
            
            NavigationLink(destination:RegisterEventView()){
                RoundedRectangle(cornerRadius: 30)
                    .foregroundStyle(.red.opacity(0.8))
                    .frame(width:360,height:60)
                    .padding()
                    .shadow(color:.gray,radius: 5,x:5,y:5)
                    .overlay(
                        Text("Register Now")
                            .bold()
                            .foregroundStyle(.white))
                
                
            }
        } //end ofVStack
        .navigationTitle("Event Details")
        
    } //end of VStack
    
    
    
}


#Preview {
    EventDetailsView(
        test: .constant(Events(id: "abcd", name: "D*code", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat", units: ["658927e6969238ac81d637ad"], date: Date.now, startTime: Date.now, endTime: Date.now, location: "VMS", rules: [], comments: [], isPending: false, isCompleted: false, isApproved: false, isRejected: true, isSuspended: false, isCancelled: false, pendingParticipantList: [], participantList: ["658927ee969238ac81d637af"], organizerList: ["658927ee969238ac81d637af"], creatorID: "658927ee969238ac81d637af", createdAt: "", updatedAt: "", v: 0)))
}

