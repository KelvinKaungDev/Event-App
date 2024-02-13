//
//  BaseTabHomeView.swift
//  Event App
//
//  Created by Austin Xu on 2024/1/22.
//

import SwiftUI

struct BaseTabHomeView: View {
//    @Binding var selectedIndex: Int
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
//                .tag($selectedIndex)
            HostEventView()
                .tabItem{
                    Label("Upload", systemImage: "square.and.arrow.up")
                }
            ProfileView()
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
