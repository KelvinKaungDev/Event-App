//
//  CreateEventModel.swift
//  Event App
//
//  Created by Akito Daiki on 4/2/2567 BE.
//

import Foundation

struct postEventData: Codable {
    let name: String
    let units: String
    let location: String
    let date: String
    let startTime: String
    let endTime: String
    let description: String
    let creatorId: String
    let organizerList: String
}
