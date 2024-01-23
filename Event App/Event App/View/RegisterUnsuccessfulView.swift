//
//  SwiftUIView.swift
//  eventsAU
//
//  Created by Swan Nay Phue Aung on 25/12/2023.
//

import SwiftUI

struct RegisterUnsuccessfulView: View {
    var body: some View {
        VStack(alignment:.center,spacing:40){
            Image(systemName: "x.circle")
                .foregroundStyle(.red)
                .font(.system(size:150))
            Text("Your Booking is Unsuccessful")
                .bold()
                .font(.system(size:35))
                .lineLimit(2)
                .multilineTextAlignment(.center)
            Text("Your booking is fail because of one of these reasons")
                .multilineTextAlignment(.center)
                .opacity(0.8)
            VStack(alignment:.leading,spacing:10){
                Text("· The maximum registrants of this event has been reached")
                Text("· The admin team has closed the registration form")
                Text("· Other reasons")
            }
            .bold()
            .padding(.horizontal)
            .multilineTextAlignment(.leading)
            .opacity(0.8)
            
            
            
            NavigationLink(destination: HomeView()){
                RoundedRectangle(cornerRadius: 30)
                    .foregroundStyle(.red.opacity(0.8))
                    .frame(width:360,height:60)
                    .shadow(color:.gray,radius: 5,x:5,y:5)
                    .overlay(
                        Text("Main Menu")
                            .bold()
                            .foregroundStyle(.white))
            }
                
        }
    }
}

#Preview {
    RegisterUnsuccessfulView()
}

