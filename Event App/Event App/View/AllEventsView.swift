//
//  AllEventsViews.swift
//  eventsAU
//
//  Created by Swan Nay Phue Aung on 25/12/2023.
//

import SwiftUI

struct AllEventsViews: View {
    let columns = [
        GridItem(.adaptive(minimum: 165))
    ]
    
    let events: [Events] = [
        Events(id: "abcd", name: "D*code", description: "Coding Club", units: ["658927e6969238ac81d637ad"], date: Date.now, startTime: Date.now, endTime: Date.now, location: "VMS", rules: [], comments: [], isPending: false, isCompleted: false, isApproved: false, isRejected: true, isSuspended: false, isCancelled: false, pendingParticipantList: [], participantList: [], organizerList: ["658927ee969238ac81d637af"], creatorID: "658927ee969238ac81d637af", createdAt: "", updatedAt: "", v: 0),
        Events(id: "1234", name: "Music", description: "Coding Club", units: ["658927e6969238ac81d637ad"], date: Date.now, startTime: Date.now, endTime: Date.now, location: "CL", rules: [], comments: [], isPending: false, isCompleted: false, isApproved: false, isRejected: true, isSuspended: false, isCancelled: false, pendingParticipantList: [], participantList: [], organizerList: ["658927ee969238ac81d637af"], creatorID: "658927ee969238ac81d637af", createdAt: "", updatedAt: "", v: 0)
    ]
    
    @State private var searchTerm = ""
    
    var filteredEvents: [Events] {
        guard !searchTerm.isEmpty else {return events}
        return events.filter {$0.name.localizedCaseInsensitiveContains(searchTerm)}
    }
    var body: some View {
        NavigationStack {
            ScrollView(.vertical,showsIndicators: false) {
                ZStack{
                    LazyVGrid(columns: columns, spacing: 120) {
                        ForEach(filteredEvents, id: \.id) { event in
                                EventCardView(test: .constant(event))
                        }
                    }
                    
                }
                .padding(.bottom,70)
                .padding(.top,60)
            }
            .searchable(text: $searchTerm, prompt: "Search Events")
        }
        
        
    }
}

#Preview {
    AllEventsViews()
}

