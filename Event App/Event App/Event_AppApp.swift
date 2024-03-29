//
//  Event_AppApp.swift
//  Event App
//
//  Created by Kelvin Gao  on 18/1/2567 BE.
//

import SwiftUI

@main
struct Event_AppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
//    @AppStorage("UserID") var userID: String?
    @AppStorage("signIn") var isSignIn = false
    @AppStorage("Is First Time User") var firstTimeUser = false
    
    
    var body: some Scene {
        WindowGroup {
            // Start of the app
//            OnboardingView()
            //ContentView()
            // if isSignIn {
            //     HomeView()
            // } else {
            //     SignInWithGoogleView()
            // }
            
            if !firstTimeUser{
                OnboardingView()
            }else{
                if isSignIn{
                    BaseTabHomeView()
                }else{
                    SignInWithGoogleView()
                }
            }
        }
    }
}
