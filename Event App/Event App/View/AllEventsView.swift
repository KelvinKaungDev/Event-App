//
//  AllEventsViews.swift
//  eventsAU
//
//  Created by Swan Nay Phue Aung on 25/12/2023.
//

import SwiftUI

struct AllEventsViews: View {
    let eventsData: [EventsData] = [
        EventsData(id: 1, name: .swiftHackathon, location: "📍 TrueLabs", date: "📆 Dec 22, 2023", image: "swiftuihackathon"),
        EventsData(id: 2, name: .fluttercamp, location: "📍 Flutter Center", date: "📆 Jan 15, 2024", image: "fluttercamp"),
        EventsData(id: 3, name: .abacChristmasParty, location: "📍 Another Location", date: "📆 Feb 10, 2024", image: "auchristmas"),
        EventsData(id: 4, name: .abacLoyKathon, location: "📍 Another Location", date: "📆 Feb 10, 2024", image: "auloykathon"),
        EventsData(id: 5, name: .abacLoyKathon, location: "📍 Another Location", date: "📆 Feb 10, 2024", image: "fluttercamp"),
        EventsData(id: 6, name: .abacLoyKathon, location: "📍 Another Location", date: "📆 Feb 10, 2024", image: "fluttercamp"),
    ]
    
    let columns = [
        GridItem(.adaptive(minimum: 165))
    ]
    
    let testData: [Events] = [
        Events(id: "abcd", name: "D*code", description: "Coding Club", units: ["658927e6969238ac81d637ad"], date: Date.now, startTime: Date.now, endTime: Date.now, location: "VMS", rules: [], comments: [], isPending: false, isCompleted: false, isApproved: false, isRejected: true, isSuspended: false, isCancelled: false, pendingParticipantList: [], participantList: [], organizerList: ["658927ee969238ac81d637af"], creatorID: "658927ee969238ac81d637af", createdAt: "", updatedAt: "", v: 0),
        Events(id: "1234", name: "Music", description: "Coding Club", units: ["658927e6969238ac81d637ad"], date: Date.now, startTime: Date.now, endTime: Date.now, location: "CL", rules: [], comments: [], isPending: false, isCompleted: false, isApproved: false, isRejected: true, isSuspended: false, isCancelled: false, pendingParticipantList: [], participantList: [], organizerList: ["658927ee969238ac81d637af"], creatorID: "658927ee969238ac81d637af", createdAt: "", updatedAt: "", v: 0)
    ]
    
    var body: some View {
        
        NavigationStack {
            ScrollView(.vertical,showsIndicators: false) {
                    ZStack{
                        LazyVGrid(columns: columns, spacing: 120) {
                            ForEach(testData, id: \.id) { test in
    //                            EventCardView(test: .constant(test))
//                                NavigationLink(destination:  EventDetailsView(test: .constant(test))) {
                                    EventCardView(test: .constant(test))
//                                }
                                
                            }
                        }
                        
                    }
                    .padding(.bottom,70)
                    .padding(.top,60)
            }
        }
        
    }
}

#Preview {
    AllEventsViews()
}

