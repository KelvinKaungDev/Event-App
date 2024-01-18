//
//  RegisterEventView.swift
//  eventsAU
//
//  Created by Swan Nay Phue Aung on 25/12/2023.
//

import SwiftUI

struct RegisterEventView: View {
    let formModel = FormModel()
    @State private var fullName: String = ""
    @State private var nickName: String = ""
    @State private var birthday: Date = Date()
    @State private var email: String = ""
    @State private var gender: String = ""
    @State private var faculty: String = ""
    @State private var question: String = ""


    
    
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
            }//end of1st section
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
        .navigationTitle("Fill Your Informaton")
        NavigationLink(destination: RegisteredSuccessView()){
            RoundedRectangle(cornerRadius: 30)
                .foregroundStyle(.red.opacity(0.8))
                .frame(width:360,height:60)
                .shadow(color:.gray,radius: 5,x:5,y:5)
                .overlay(
                    Text("Register Now")
                        .bold()
                        .foregroundStyle(.white))
        }
        
        
    }
    
}

#Preview {
    RegisterEventView()
}

