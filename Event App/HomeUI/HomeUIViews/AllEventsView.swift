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
    
    var body: some View {
       
        
        
            ScrollView(.vertical,showsIndicators: false) {
                ZStack{
                    LazyVGrid(columns: columns, spacing: 120) {
                        ForEach(eventsData, id: \.id) { event in
                            NavigationLink(destination:  EventDetailsView(event:event)) {
                                EventCardView(event: event)
                                
                            }
                            
                        }
                    }
                    
                }
                .padding()
            }
        
    }
}

#Preview {
    AllEventsViews()
}

