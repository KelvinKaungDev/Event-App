//
//  RegisterEventView.swift
//  eventsAU
//
//  Created by Swan Nay Phue Aung on 25/12/2023.
//

import SwiftUI

struct RegisterEventView: View {
    @Binding var path: [String]
    var event: Events
    
    let formModel = FormModel()
    @State private var fullName: String = ""
    @State private var nickName: String = ""
    @State private var birthday: Date = Date()
    @State private var email: String = ""
    @State private var gender: String = ""
    @State private var faculty: String = ""
    @State private var question: String = ""
    @State var userJoinVM = UserJoinEventViewModel()
    @State var showAlert = false
        
    var body: some View {
        Form{
            Section("Personal Information") {
                TextField("Full Name", text: $fullName)
                TextField("Nickname", text: $nickName)
                DatePicker("Date of Birth", selection: $birthday, displayedComponents: .date)
                TextField("Email Address", text: $email)
                Picker("Gender", selection: $gender) {
                    ForEach(formModel.gender, id: \.self){
                        Text($0)
                    }
                }.pickerStyle(.segmented)
            }//end of 1st section
            Picker("Faculty", selection: $faculty) {
                ForEach(formModel.faculty, id: \.self){
                    Text($0)
                }
            }.pickerStyle(.inline)
            
            Section("Ask Anything") {
                TextField("Do you have anything to ask?", text: $question)
            }
            
        }
        .accentColor(.red)
        
        Button(action: {
            print("Register success")
            if let userId = UserDefaults.standard.string(forKey: "UserID"){
                userJoinVM.userJoinEvent(userId: userId, eventId: event.id)
            }
            showAlert.toggle()
        }, label: {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 150, height: 35)
                .foregroundStyle(.blue)
                .overlay {
                    Text("Register Event")
                        .foregroundStyle(.white)
                }
        })
        .alert("Event Registration Success", isPresented: $showAlert) {
            NavigationLink(value: "success") {
                Text("OK")
            }
        }
        
        .navigationTitle("Fill Your Informaton")

    }
    
}

//#Preview {
//    RegisterEventView(event: .constant(Events(id: "abcd", name: "Music Festival", description: "Coding Club", units: ["658927e6969238ac81d637ad"], date: "", startTime: "", endTime:" Date.now", location: "VMS", rules: [], comments: [], isPending: false, isCompleted: false, isApproved: false, isRejected: true, isSuspended: false, isCancelled: false, pendingParticipantList: [], participantList: [], organizerList: ["658927ee969238ac81d637af"], creatorID: "658927ee969238ac81d637af", createdAt: "", updatedAt: "", v: 0)))
    
//}

