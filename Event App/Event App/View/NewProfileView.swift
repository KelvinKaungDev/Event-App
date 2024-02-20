//
//  NewProfileView.swift
//  Event App
//
//  Created by Swan Nay Phue Aung on 16/02/2024.
//

import SwiftUI
struct NewProfileView: View {
    
    
    var body: some View {
        
        
        
        
        
        VStack(alignment:.leading,spacing:10) {
            HStack(alignment:.top,spacing:10){
                Image("profilePic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width:85,height:85)
                VStack(alignment:.leading,spacing:5){
                    Text("Angela Yu")
                        .font(.system(size:20))
                    //                    .bold()
                    Text("Vincent Mary School of Science and technology")
                        .font(.system(size:20))
                        .foregroundStyle(.gray.opacity(0.9))
                    
                }
                
                Button(action: {}, label: {
                    Text("Edit")
                })
                
            }
            .padding(.vertical)
            
            VStack(alignment:.leading,spacing:10){
                Text("chayapolmomem@gmail.com")
                    .font(.system(size:20))
                
                Text("0963137293")
                    .font(.system(size:20))
                    .foregroundStyle(.gray.opacity(0.9))
                
            }
            
            
            VStack(alignment:.leading,spacing:10){
                Text("Current Events")
                    .fontWeight(.heavy)
                    .font(.system(size:25))
                    .padding(.vertical)
                
                ParticipatingEventListView()
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 120, trailing: 10))
               
                
            }
            
            VStack(alignment:.leading,spacing:10){
                Text("Previous Events")
                    .fontWeight(.heavy)
                    .font(.system(size:25))
                    .padding(.vertical)
                
                ParticipatedEventListView()
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 40, trailing: 10))
               
                
                
               
                
            }
            
            
            
            
            
        }
        .padding()
        Spacer()
    }
    
    
}
             
                
                
        
            
            
            
            
    
#Preview {
    NewProfileView()
}
