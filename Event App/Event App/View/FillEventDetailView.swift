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
    @State var options = ["Education", "Entertainment", "Networking", "Design"]
    @State private var eventTitle = ""
    @State private var category = ""
    @State private var venue = ""
    @State private var participants = 0
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var startTime = Date()
    @State private var endTime = Date()
    @State private var desc = ""
    @State private var showDatePicker = false
    @State private var shouldNavigate = false
    
            
    var limitRange: ClosedRange<Date>{
        let oneMonthAgo = Calendar.current.date(byAdding: .month, value: -1, to: Date())
        let twoMonthFromNow = Calendar.current.date(byAdding: .month,value: 2, to: Date())
        return oneMonthAgo!...twoMonthFromNow!
    }
    
    var body: some View {
        ScrollView {
            VStack{
//                VStack {
//                    RoundedRectangle(cornerRadius: 10)
//                        .stroke(Color("text_color_grey"))
//                        .fill(.white)
//                        .overlay(
//                            avatarImage?
//                                .resizable()
//                                .scaledToFit()
////                                .frame(width: 300, height: 300)
//                        ).frame(width: 300, height: 300)
//                    PhotosPicker("Select avatar", selection: $avatarItem, matching: .images)
                    
                    
//                }
//                .onChange(of: avatarItem) {
//                    Task {
//                        if let loaded = try? await avatarItem?.loadTransferable(type: Image.self) {
//                            avatarImage = loaded
//                        } else {
//                            print("Failed")
//                        }
//                    }
//                }
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
                        HStack(alignment: .center){
                            TextField("Category", text:$category).disabled(true)
                            Spacer()
                            Menu{
                                ForEach(options, id:\.self){item in
                                    Button {
                                        category = item
                                    } label: {
                                        Text(item)
                                    }
                                }
                            }label: {
                                Image(systemName: "arrowtriangle.down.fill")
                                    .resizable()
                                    .frame(width: 10, height: 10)
                                    .foregroundColor(.black)
                            }
                        }.padding()
                    ).frame(width: 300, height: 50)

                
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
                        dateFormatter.dateFormat = "dd-MM-yyyy"
                        let timeFormatter = DateFormatter()
                        timeFormatter.dateFormat = "HH:mm"
                        
                        print(eventTitle, category, venue, participants, dateFormatter.string(from: startDate), dateFormatter.string(from: endDate),timeFormatter.string(from: startTime),timeFormatter.string(from: endTime),desc)
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
    }
}



#Preview {
    FillEventDetailView()
}

