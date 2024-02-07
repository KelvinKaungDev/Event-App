//
//  CreatedEventListView.swift
//  Event App
//
//  Created by Akito Daiki on 7/2/2567 BE.
//
import SwiftUI

struct CreatedEventListView: View {
    @ObservedObject var viewModel = UserViewModel.shared
    @State private var storedUserId: String = ""
    @State private var createdEventList: [Events] = [] // Change to Events array
    var body: some View {
        VStack{
//            List(createdEventList, id: \.id) { event in // Use Events' id as identifier
//                VStack(alignment: .leading) {
//                    Text(event.name)
//                        .font(.headline)
//                    Text(event.description)
//                        .font(.subheadline)
//                    Text("Date: \(formattedDate(event.date))")
//                        .font(.subheadline)
//                    Text("Location: \(event.location)")
//                        .font(.subheadline)
//                    // Add more details as needed
//                }
//            }
            Text("Hello")
        }
        .onAppear(perform: {
            if let userId = UserDefaults.standard.string(forKey: "UserID"){
                print("UserID in UserDefaults: \(userId)")
                storedUserId = userId
                viewModel.fetchUserPopulateEventList(userId: userId){ result in
                    switch result {
                    case .success(let eventList):
                        DispatchQueue.main.async {
                            // Assign the retrieved event list to createdEventList
                            self.createdEventList = eventList.createdEventList ?? []
                            print(eventList.createdEventList ?? [])
                        }
                    case .failure(let error):
                        print(error)
                    }
                }
            } else {
                print("No UserID found in UserDefaults.")
                storedUserId = ""
            }
        })
    }
    
    // Function to format date
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}


#Preview {
    CreatedEventListView()
}
