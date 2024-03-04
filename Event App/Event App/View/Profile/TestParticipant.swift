//
//  TestParticipant.swift
//  Event App
//
//  Created by Austin Xu on 2024/3/4.
//

import SwiftUI

struct TestParticipant: View {
    
    @ObservedObject var vm = EventParticipantViewModel.shared
    
    
    var body: some View {
        Text("Hello, World!")
            .onAppear {
                vm.getEventByOrgId(orgId: "65bb2731812a0732d17c2fc4", eventId: "65c33f3adcd7d813bbde17f7") { response in
                    switch response{
                    case .success(let data):
                        print(data)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
    }
}

#Preview {
    TestParticipant()
}
