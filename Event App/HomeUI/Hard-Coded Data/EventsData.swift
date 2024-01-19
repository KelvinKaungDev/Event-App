//
//  EventsData.swift
//  Event App
//
//  Created by Swan Nay Phue Aung on 18/01/2024.
//

//
//  EventsData.swift
//  eventsAU
//
//  Created by Swan Nay Phue Aung on 24/12/2023.
//

import Foundation
struct EventsData {
    var id:Int
    var name:EventsTitle
    var location:String
    var date: String
    var image:String
}

enum EventsTitle: String {
    case swiftHackathon = "Swift Hackathon"
    case fluttercamp = "Flutter Code Camp"
    case abacChristmasParty = "Christmas Party"
    case abacLoyKathon = "ABAC Loykathon"
}




struct EventCategoryTitle {
    var id:Int
    var name:EventCategory
}

enum EventCategory:String{
    case allEvents = "All Events"
    case music = "Music"
    case design = "Design"
    case tech = "Tech"
    case entertainment = "Entertainment"
    
    
}

