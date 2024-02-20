//
//  ParticipantApprovalView.swift
//  Event App
//
//  Created by Swan Nay Phue Aung on 19/02/2024.
//

import SwiftUI

struct ParticipantApprovalView: View {
//    @State var participantData:Events
    
    
    var body: some View {
    
        VStack(alignment:.leading,spacing:20){
            
            Text("Registrants")
                .fontWeight(.heavy)
                .font(.system(size:30))
            
            
            RoundedRectangle(cornerRadius: 17)
                .frame(width:297,height:480)
                .foregroundStyle(.white)
                .shadow(color:.gray,radius:5)
                .overlay(
                
                
                
                Text("heh")
                
                )
            
            
            
        }
        .padding()
        
        
        
        
        
    }
}

#Preview {
    ParticipantApprovalView()
}
