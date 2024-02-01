//
//  BaseTabHomeView.swift
//  Event App
//
//  Created by Austin Xu on 2024/1/22.
//

import SwiftUI

struct BaseTabHomeView: View {
    var body: some View {
        TabView{
            BaseHomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                
            HostEventView()
                .tabItem{
                    Label("Upload", systemImage: "square.and.arrow.up")
                }
            Text("Profile")
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
        .navigationBarBackButtonHidden()
        
        
    }
}

#Preview {
    BaseTabHomeView()
}
