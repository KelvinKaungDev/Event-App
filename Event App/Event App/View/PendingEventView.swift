//
//  PendingEventView.swift
//  Event App
//
//  Created by Austin Xu on 2024/1/22.
//

import SwiftUI

struct PendingEventView: View {
    var body: some View {
        VStack{
            Image("event_host")
                .resizable()
                .frame(width: 400, height: 400)
            Text("Your Event is Pending")
                .fontWeight(.bold)
                .font(.system(size: 30))
            Text("Please wait patiently for the approval. We're reviewing your event application.")
                .multilineTextAlignment(.center)
                .font(.system(size: 12))
                .padding()
                .foregroundColor(Color("text_color_grey"))
            NavigationLink(destination: BaseTabHomeView()) {
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
                        Text("Main Menu")
                            .foregroundColor(.white)
                        , alignment: .center
                    )
            }
        }
        
    }
}

#Preview {
    PendingEventView()
}
