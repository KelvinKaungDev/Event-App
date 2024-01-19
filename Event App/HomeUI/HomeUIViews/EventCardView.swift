//
//  EventCardView.swift
//  eventsAU
//
//  Created by Swan Nay Phue Aung on 24/12/2023.
//

import SwiftUI

struct EventCardView: View {
    let event:EventsData
    var body: some View {
       
           
            ZStack {
               
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.white)
                    .shadow(color:.gray,radius: 5,x:5,y:5)
                VStack {
                   
                    Image("swiftuihackathon")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 165, height: 120)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .offset(y:-20)
                    
                    // Text Overlay
                    VStack(alignment:.leading,spacing:10){
                    Text("\(event.name.rawValue)")
                            .font(.system(size:20))
                        .foregroundColor(.black)
                        .bold()
                        .lineLimit(3)
                        .offset(y:-10)
                        
                        
                        Text("\(event.location)")
                            .font(.system(size:16))
                            .foregroundColor(.black)
                            .lineLimit(1)
                        
                        
                        
                        Text("\(event.date)")
                            .font(.system(size:16))
                            .foregroundColor(.black)
                            .lineLimit(1)
                     
                    }
                    .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.leading)
                        .padding()
                     
                    
                }
                
              
            } // end of ZStack
            .frame(width: 165, height: 200)
            

        }
    }
        
 


#Preview {
    EventCardView(event:EventsData.init(id: 1, name: .swiftHackathon, location: "📍 TrueLabs", date: "📆 Dec 22, 2023", image: "swiftuihackathon"))
}

