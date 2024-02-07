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
    
    @State var events: [Events]?
    
    @State private var searchTerm = ""
    @ObservedObject private var eventvm = EventViewModel()
    
    var filteredEvents: [Events] {
        guard !searchTerm.isEmpty else {return events ?? []}
        return events!.filter {$0.name.localizedCaseInsensitiveContains(searchTerm)}
    }
    var body: some View {
        NavigationStack {
            ScrollView(.vertical,showsIndicators: false) {
                ZStack{
                    LazyVGrid(columns: columns, spacing: 120) {
                    
                        ForEach(filteredEvents, id: \.id) { event in
                                EventCardView(event: .constant(event))
                        }
                    
                        
                    }
                    
                }
                .padding(.bottom,70)
                .padding(.top,60)
            }
            .searchable(text: $searchTerm, prompt: "Search Events")
        }
        .onAppear(perform: {
            eventvm.fetchEvents { result in
                switch result{
                case .success(let events):
                    self.events = events
                case .failure(let error):
                    print(error)
                }
            
            }
        })
        
        
    }
}

#Preview {
    AllEventsViews()
}

