//
//  RegisteredSuccessView.swift
//  eventsAU
//
//  Created by Swan Nay Phue Aung on 25/12/2023.
//

import SwiftUI

struct RegisteredSuccessView: View {
    @Binding var path: [String]
    var body: some View {
        VStack(alignment:.center,spacing:40){
            Image(systemName: "checkmark.circle")
                .foregroundStyle(.green)
                .font(.system(size:150))
            Text("Your Booking is Successful")
                .bold()
                .font(.system(size:35))
                .lineLimit(2)
            Text("We have sent you the confirmation mail and your ticket ID to your provided email address")
                .multilineTextAlignment(.center)
                .opacity(0.8)
//            NavigationLink(destination: BaseTabHomeView()){
//                RoundedRectangle(cornerRadius: 30)
//                    .foregroundStyle(.red.opacity(0.8))
//                    .frame(width:360,height:60)
//                    .shadow(color:.gray,radius: 5,x:5,y:5)
//                    .overlay(
//                        Text("Main Menu")
//                            .bold()
//                            .foregroundStyle(.white))
//            }
//                
            Button(action: {
                path.removeAll()
            }, label: {
                Text("Go to root")
            })
        } // end of VStack
        .navigationBarHidden(true)
    }
}

//#Preview {
//    RegisteredSuccessView()
//}

