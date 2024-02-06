//
//  FillEventDetailView.swift
//  Event App
//
//  Created by Austin Xu on 2024/1/22.
//

import SwiftUI
import PhotosUI

struct FillEventDetailView: View {
//    @State private var avatarItem: PhotosPickerItem?
//    @State private var avatarImage: Image?
//    @State var options = ["Education", "Entertainment", "Networking", "Design"]
    @State private var eventTitle = ""
//    @State private var category = ""
    @State private var venue = ""
    @State private var participants = 0
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var startTime = Date()
    @State private var endTime = Date()
    @State private var desc = ""
    @State private var showDatePicker = false
    @State private var shouldNavigate = false
    @State private var selectedUnitId = ""
    @State private var selectedUnitName: String = ""
    @State private var units: [Units]?
    @State private var errorMessage: String?
    @ObservedObject var viewModel = UnitViewModel()
    @ObservedObject var hostEventViewModel = HostEventViewModel()
    
            
    var limitRange: ClosedRange<Date>{
        let oneMonthAgo = Calendar.current.date(byAdding: .month, value: -1, to: Date())
        let twoMonthFromNow = Calendar.current.date(byAdding: .month,value: 2, to: Date())
        return oneMonthAgo!...twoMonthFromNow!
    }
    
    var body: some View {
        ScrollView {
            VStack{
                // Event Title
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("text_color_grey"))
                    .fill(.white)
                    .overlay(
                        HStack(alignment: .center){
                            TextField("Event Title", text:$eventTitle)
                        }.padding()
                    ).frame(width: 300, height: 50)
                
                
                // Category
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("text_color_grey"))
                    .fill(.white)
                    .overlay(
                        Group {
                            if let units = units, !units.isEmpty {
                                HStack {
                                    TextField("Select a Unit", text: $selectedUnitName)
                                        .disabled(true)
                                    Spacer()
                                    Menu {
                                        ForEach(units, id: \.id) { unit in
                                            Button(unit.name) {
                                                selectedUnitId = unit.id
                                                selectedUnitName = unit.name // Update the TextField display
                                            }
                                        }
                                    } label: {
                                        Image(systemName: "arrowtriangle.down.fill")
                                            .resizable()
                                            .frame(width: 10, height: 10)
                                            .foregroundColor(.black)
                                    }
                                }
                                .padding()
                            } else if let errorMessage = errorMessage {
                                Text("Error: \(errorMessage)")
                            } else {
                                Text("Loading...")
                            }
                        }
                        .tint(Color("text_color_grey"))
                    )
                    .frame(width: 300, height: 50)

                
                // Venue
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("text_color_grey"))
                    .fill(.white)
                    .overlay(
                        HStack(alignment: .center){
                            TextField("Venue", text:$venue)
                            
                        }.padding()
                    ).frame(width: 300, height: 50)

                
                // Number of Participants
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("text_color_grey"))
                    .fill(.white)
                    .overlay(
                        HStack(alignment: .center){
                            Stepper(participants == 0 ? "Number of Participants": "\(participants)", value:$participants)
                        }.padding()
                    ).frame(width: 300, height: 50)
                
                // Start Date
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("text_color_grey"))
                    .fill(.white)
                    .overlay {
                        DatePicker("Start Date", selection: $startDate, in:limitRange,displayedComponents: [.date])
                            .padding()
                    }.frame(width: 300, height: 50)

                // End Date
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("text_color_grey"))
                    .fill(.white)
                    .overlay {
                        DatePicker("End Date", selection: $endDate, in: limitRange,displayedComponents: [.date])
                            .padding()
                    }.frame(width: 300, height: 50)

                // Start Time
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("text_color_grey"))
                    .fill(.white)
                    .overlay {
                        DatePicker("Start Time", selection: $startTime, in:limitRange,displayedComponents: [.hourAndMinute])
                            .padding()
                    }.frame(width: 300, height: 50)

                // End Time
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("text_color_grey"))
                    .fill(.white)
                    .overlay {
                        DatePicker("End Time", selection: $endTime, in:limitRange,displayedComponents: [.hourAndMinute])
                            .padding()
                    }.frame(width: 300, height: 50)
                
                // Description
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("text_color_grey"))
                    .fill(.white)
                    .overlay {
                        VStack {
                            TextField("Description", text:$desc, axis: .vertical)
                                .lineLimit(4)
                            Spacer()
                        }.padding()
                    }.frame(width: 300, height: 130)
                    
                NavigationLink(destination: PendingEventView(), isActive: $shouldNavigate) {
                    Button {
                        // add action here
                        
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "dd-MM-yyyy-HH:mm"
                        let timeFormatter = DateFormatter()
                        timeFormatter.dateFormat = "HH:mm"
                        let startDateStr = dateFormatter.string(from: startDate) + "T" + timeFormatter.string(from: startTime)
                        let endDateStr = dateFormatter.string(from: endDate) + "T" + timeFormatter.string(from: endTime)
                        
                        print(eventTitle, venue, participants, dateFormatter.string(from: startDate), dateFormatter.string(from: endDate),timeFormatter.string(from: startTime),timeFormatter.string(from: endTime),desc)
                        // post the created event
                        guard let userId = UserDefaults.standard.string(forKey: "UserID") else {return}
                        let eventData = postEventData(
                            name: eventTitle,
                            units: selectedUnitId,
                            location: venue,
                            startTime: startDateStr,
                            endTime: endDateStr,
                            description: desc,
                            creatorId: userId,
                            organizerList: userId
                        )
                        hostEventViewModel.hostEvent(eventData: eventData) { success, errorMessage in
                            if success {
                                print("Event successfully hosted")
                                self.shouldNavigate = true
                            } else {
                                print("Failed to host event: \(errorMessage ?? "Unknown error")")
                            }
                        }
                        self.shouldNavigate.toggle()
                    } label: {
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
                                Text("Host an Event")
                                    .foregroundColor(.white)
                                , alignment: .center
                            )
                    }
                }
            }
            .padding()
            .navigationTitle("Fill Event Details")
            .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
        }
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



#Preview {
    FillEventDetailView()
}

