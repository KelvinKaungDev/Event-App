//
//  HeaderView.swift
//  Event App
//
//  Created by Akito Daiki on 1/2/2567 BE.
//

import SwiftUI

struct HeaderView: View {
    
    let title : String
    let subtitle : String
    let angle : Double
    let background : Color
    
    var body: some View {
        ZStack{
            
            RoundedRectangle(cornerRadius: 100)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
                .opacity(0.6)
            
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.primary)
                    .bold()
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.primary)
            }
            .padding(.top,80)
        }
        .offset(y: -150)
    }
}

#Preview {
    HeaderView(title: "Title",
               subtitle: "Subtitle",
               angle: -45,
               background: .mint)
}
