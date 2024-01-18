//
//  HomeView.swift
//  Event App
//
//  Created by Austin Xu on 2024/1/18.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView{
            Text("Home")
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
    HomeView()
}
