//
//  EventDetailsView.swift
//  eventsAU
//
//  Created by Swan Nay Phue Aung on 25/12/2023.
//

import SwiftUI

struct EventDetailsView: View {
    let event: EventsData
    @State var isExpanded = false
    let longText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"
    var body: some View {
        
        VStack(alignment:.leading,spacing:15){
            Image(event.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: 317)
            ScrollView(.vertical,showsIndicators: true){
                VStack(alignment:.leading,spacing:15){
                    Text(event.name.rawValue)
                        .bold()
                        .font(.system(size:25))
                    Text(event.location)
                        .fontWeight(.regular)
                        .font(.system(size:18))
                    HStack{
                        Text(event.date)
                            .fontWeight(.regular)
                            .font(.system(size:18))
                            .opacity(0.8)
                        Text("⏰ 9 AM Onwards")
                            .fontWeight(.regular)
                            .font(.system(size:18))
                            .opacity(0.8)
                        
                    }
                    HStack{
                        Image(systemName: "person.crop.circle")
                            .foregroundStyle(.red)
                        Text("21 people")
                            .foregroundStyle(.red)
                        +
                        Text(" attending this event")
                        
                    }
                    Text("Description")
                        .bold()
                        .font(.system(size:20))
                    Text(longText)
                    
                }
                
                //                if !isExpanded {
                //                    Button("Read more...") {
                //                        isExpanded.toggle()
                //                    }
                //                    .foregroundColor(.red)
                ////                    .padding()
                //                }
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
    EventDetailsView(event:EventsData.init(id: 1, name: .swiftHackathon, location: "📍 TrueLabs, VMC", date: "📆 Dec 22, 2023", image: "swiftuihackathon"))
}

