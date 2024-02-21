//
//  RegistrationView.swift
//  Event App
//
//  Created by Akito Daiki on 19/1/2567 BE.
//

import SwiftUI
import Firebase
import FirebaseAuth
import GoogleSignIn
import Alamofire
import CoreLocation
    
struct RegistrationView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var gender = ""
    @State private var age = ""
    @State private var phoneNumber = ""
    @State private var authentication = Auth.auth()
    @ObservedObject var viewModel = UnitViewModel()
    @State private var units: [Units]?
    @State private var errorMessage: String?
    @State private var selectedUnitId = ""
    @State private var showingSuccessAlert = false
    @ObservedObject var userPostViewModel = UserPostViewModel()
    @State private var goToSignIn = false
    
    
    
    var isFormValid: Bool {
        !firstName.isEmpty && !lastName.isEmpty && !gender.isEmpty && !age.isEmpty && !phoneNumber.isEmpty && selectedUnitId != nil
    }
    
    var body: some View {
        if goToSignIn{
            SignInWithGoogleView()
        } else {
            VStack {
                Text("events.au")
                    .fontWeight(.bold)
                    .font(.system(size: 24))
                    .overlay(
                        LinearGradient(gradient: Gradient(colors: [Color("red_primary"), Color("red_secondary")]), startPoint: .top, endPoint: .bottom)
                            .mask(Text("events.au").fontWeight(.bold).font(.system(size: 24)))
                    )
                Spacer()
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("text_color_grey"))
                    .fill(.white)
                    .overlay(
                        HStack(alignment: .center){
                            TextField("First Name", text: $firstName)
                        }.padding()
                    ).frame(width: 300, height: 50)
                Spacer()
                
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("text_color_grey"))
                    .fill(.white)
                    .overlay(
                        HStack(alignment: .center){
                            TextField("Last Name", text: $lastName)
                        }.padding()
                    ).frame(width: 300, height: 50)
                Spacer()
                
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("text_color_grey"))
                    .fill(.white)
                    .overlay(
                        Picker(selection: $gender, label: Text("Gender")) {
                            Text("Select your gender").tag("")
                            Text("Male").tag("Male")
                            Text("Female").tag("Female")
                        }
                            .tint(LinearGradient(gradient: Gradient(colors: [Color("red_primary"), Color("red_secondary")]), startPoint: .top, endPoint: .bottom))
                            .pickerStyle(MenuPickerStyle())
                            .padding()
                            .foregroundColor(.black)
                    ).frame(width: 300, height: 50)
                Spacer()
                
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("text_color_grey"))
                    .fill(.white)
                    .overlay(
                        HStack(alignment: .center){
                            TextField("Age", text: $age)
                        }.padding()
                    ).frame(width: 300, height: 50)
                Spacer()
                
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("text_color_grey"))
                    .fill(.white)
                    .overlay(
                        HStack(alignment: .center){
                            TextField("Phone Number", text: $phoneNumber)
                        }.padding()
                    ).frame(width: 300, height: 50)
                Spacer()
                
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("text_color_grey"))
                    .fill(.white)
                    .overlay(
                        Group {
                            if let units = units {
                                // Display the units in a Picker
                                Picker("Select a Unit", selection: $selectedUnitId) {
                                    Text("Select a Unit").tag("Units")
                                    ForEach(units, id: \.id) { unit in
                                        Text(unit.name).tag(unit.id as String?)
                                    }
                                }
                            } else if let errorMessage = errorMessage {
                                // Display error message
                                Text("Error: \(errorMessage)")
                            } else {
                                // Show loading state
                                Text("Loading...")
                            }
                        }
                            .tint(LinearGradient(gradient: Gradient(colors: [Color("red_primary"), Color("red_secondary")]), startPoint: .top, endPoint: .bottom))
                            .pickerStyle(MenuPickerStyle())
                            .padding()
                            .foregroundColor(.black)
                    ).frame(width: 300, height: 50)
                Spacer()
                
                RoundedRectangle(cornerRadius: 50)
                    .fill(
                        LinearGradient(
                            colors: [Color("red_primary"),
                                     Color("red_secondary")],
                            startPoint: .top,
                            endPoint: .bottom)
                    )
                    .frame(width: 300, height: 50)
                    .overlay(
                        Button("Create User") {
                            if isFormValid {
                                userPostViewModel.createUser(
                                    firstName: firstName, lastName: lastName, gender: gender, age: age, phoneNumber: phoneNumber, selectedUnitId: selectedUnitId) { success in
                                    if success {
                                        showingSuccessAlert = true
                                    }
                                }
                            }
                        }
                            .disabled(!isFormValid)
                            .alert(isPresented: $showingSuccessAlert) {
                                Alert(title: Text("Registration Successful"), message: Text("You have been registered successfully."), dismissButton: .default(Text("OK")){
                                    goToSignIn = true
                                })
                            }
                            .tint(Color.white)
                    )
                    .padding()
            }
            .padding()
            .onAppear(perform: {
                viewModel.fetchAllUnits{ result in
                    switch result {
                    case .success(let fetchedUnits):
                        self.units = fetchedUnits
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                    }
                }
            })
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}


//    @State private var navigateToHome = false
//    @State private var isUserCreated = false
//    @State private var unitName: String = ""
//    @State private var navigateToLogin = false
