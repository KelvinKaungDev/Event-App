//
//  BaseTabHomeView.swift
//  Event App
//
//  Created by Austin Xu on 2024/1/22.
//

import SwiftUI

struct BaseTabHomeView: View {
    var body: some View {
        TabView(){
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(0)
            HostEventView()
                .tabItem{
                    Label("Upload", systemImage: "square.and.arrow.up")
                }
                .tag(1)
            MainProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
                .tag(2)
        }
        .navigationBarBackButtonHidden()
        
        
    }
}

#Preview {
    BaseTabHomeView()
}
