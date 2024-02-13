//
//  AllEventsViews.swift
//  eventsAU
//
//  Created by Swan Nay Phue Aung on 25/12/2023.
//

import SwiftUI

struct AllEventsViews: View {
    @State var isLoading = false
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
                    if isLoading {
                        ProgressView("Loading...")
                            .progressViewStyle(CircularProgressViewStyle())
                            .tint(.white)
                            .padding()
                            .foregroundStyle(.white)
                    } else{
                    LazyVGrid(columns: columns, spacing: 120) {
                        
                        ForEach(filteredEvents, id: \.id) { event in
                            if event.isPending == false{
                                EventCardView(event: .constant(event))
                            }
                        }
                        
                        
                    }
                    .searchable(text: $searchTerm, prompt: "Search Events")}
                    
                }
                .padding(.bottom,70)
                .padding(.top,60)
            }
        }
        .onAppear(perform: {
            isLoading = true
            fetchEventData()
        })
//        .onAppear(perform: {
//            
//        })
        
        
    }
    func fetchEventData(){
        eventvm.fetchEvents { result in
            isLoading = false
            switch result{
            case .success(let events):
                self.events = events
            case .failure(let error):
                print(error)
            }
        
        }
    }
}

#Preview {
    AllEventsViews()
}

