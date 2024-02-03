//
//  SearchBarItemView.swift
//  eventsAU
//
//  Created by Swan Nay Phue Aung on 25/12/2023.
//

import SwiftUI

struct SearchBarItemView: View {
    @State private var searchKeyword = ""
    
    
    var body: some View {
        
        VStack {  
            RoundedRectangle(cornerRadius: 120)
                .stroke(Color("text_color_grey"))
                .fill(.white)
                .overlay(
                    HStack {
                        TextField("Find Events", text: $searchKeyword)
                            .padding(.horizontal, 10)
                            .foregroundColor(.white)
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                            .padding(.horizontal)
                    }.padding(.horizontal)
                ).frame(width: 360, height: 48)
            Spacer()
                .frame(height: 20)
            HStack{
                Text("Upcoming Events")
                    .font(.system(size: 30))
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                Spacer()
            }.padding(.horizontal, 20)

            Spacer()
            AllEventsViews()
            
        }
//        .frame(height: 36) // Set a fixed height for the search bar
//        .padding(.horizontal, 16)
    }
        

    
}
#Preview {
    SearchBarItemView()
}

