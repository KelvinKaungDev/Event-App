//
//  SearchBarItemView.swift
//  eventsAU
//
//  Created by Swan Nay Phue Aung on 25/12/2023.
//

import SwiftUI

struct SearchBarItemView: View {
    @Binding var searchKeyword: String
    
    var body: some View {
        
        ZStack {
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 360, height: 48)
              .background(.white.opacity(0.2))
              .cornerRadius(120)
              .overlay(
                RoundedRectangle(cornerRadius: 120)
                  .inset(by: 0.5)
                  .stroke(Color(red: 0.67, green: 0.67, blue: 0.67), lineWidth: 1)
              )
            
            HStack {
                
                TextField("Find Events", text: $searchKeyword)
                    .padding(.horizontal, 10)
                    .foregroundColor(.white)
                
                
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    
                
            }
            .padding(.horizontal)
        }
        .frame(height: 36) // Set a fixed height for the search bar
        .padding(.horizontal, 16)
    }
        

    
}
#Preview {
    SearchBarItemView(searchKeyword: .constant("Seach your events"))
}

