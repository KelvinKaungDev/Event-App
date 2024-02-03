//
//  EventCardView.swift
//  eventsAU
//
//  Created by Swan Nay Phue Aung on 24/12/2023.
//

import SwiftUI

struct EventCardView: View {
    @Binding var event: Events
    var body: some View {
        NavigationLink(destination: EventDetailsView(event: .constant(event)), label: {
            ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                        .shadow(color:.gray,radius: 5,x:5,y:5)
                    VStack {
                       
                        Image("swiftuihackathon")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 165, height: 120)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .offset(y:-20)
                        
                        // Text Overlay
                        
                        VStack(alignment:.leading,spacing:10){
                            Text("\(event.name)")
                                .font(.system(size:20))
                            .foregroundColor(.black)
                            .bold()
                            .lineLimit(3)
                            .offset(y:-10)
           
                            Text("\(event.location)")
                                .font(.system(size:16))
                                .foregroundColor(.black)
                                .lineLimit(1)

                            Text("\(K.dateformatter(date: event.date))")
                                .font(.system(size:16))
                                .foregroundColor(.black)
                                .lineLimit(1)
                         
                        }
                        .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.leading)
                            .padding()
                         
                        
                    }
                  
                } // end of ZStack
            .frame(width: 165, height: 200)
        }
            
            
        )}
    }
        
 


#Preview {
    EventCardView(
        event: .constant(Events(id: "abcd", name: "Music Festival", description: "Coding Club", units: ["658927e6969238ac81d637ad"], date: Date.now, startTime: Date.now, endTime: Date.now, location: "VMS", rules: [], comments: [], isPending: false, isCompleted: false, isApproved: false, isRejected: true, isSuspended: false, isCancelled: false, pendingParticipantList: [], participantList: [], organizerList: ["658927ee969238ac81d637af"], creatorID: "658927ee969238ac81d637af", createdAt: "", updatedAt: "", v: 0)))
}

