//
//  HostEventView.swift
//  Event App
//
//  Created by Austin Xu on 2024/1/22.
//

import SwiftUI

struct HostEventView: View {
    var body: some View {
        NavigationStack {
            VStack{
                Image("event_host")
                    .resizable()
                    .frame(width: 400, height: 400)
                Text("Host Event With Us!")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                Text("Hosting your event with us ensures a straightforward process. Simply submit your event for approval and watch as your idea transforms into a memorable experience for attendees.")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 12))
                    .padding()
                    .foregroundColor(Color("text_color_grey"))
                NavigationLink(destination: FillEventDetailView()) {
                    RoundedRectangle(cornerRadius: 50)
                        .fill(
                            LinearGradient(
                                colors: [Color("red_primary"),
                                         Color("red_secondary")],
                                startPoint: .top,
                                endPoint: .bottom)
                        )
                        .frame(width: 300, height: 50)
                        .overlay(
                            Text("Host an Event")
                                .foregroundColor(.white)
                            , alignment: .center
                        )
                }
                    
            }
        }
        
    }
}

#Preview {
    HostEventView()
}
