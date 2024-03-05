//
//  EventParticipantModel.swift
//  Event App
//
//  Created by Austin Xu on 2024/3/4.
//

//import Foundation
//
//struct EventParticipantModel: Codable{
//    let success: Bool
//    let message: EventParticipant
//}
//
//struct EventParticipant: Codable{
//    let id: String
//    let name, description: String
//    let units: [EventParticipantUnit]
//    let date, startTime, endTime: String
//    let location: String
//    let isPending, isCompleted, isApproved, isRejected, isSuspended, isCancelled: Bool
//    let pendingParticipantList, participantList: [EventParticipantIdAndName]?
//    let organizerList: [EventParticipantIdAndName]
//    let creatorId, createdAt, updatedAt: String
//    let v: Int
//    let creator: EventParticipantIdAndName
//    
//    enum CodingKeys: String, CodingKey {
//        case id = "_id", name, description, units, date, startTime, endTime, location, isPending, isCompleted, isApproved, isRejected, isSuspended, isCancelled, pendingParticipantList, participantList, organizerList, creatorId, createdAt, updatedAt, creator
//        case v = "__v"
//    }
//}
//
//struct EventParticipantUnit: Codable, Identifiable{
//    let id: String
//}
//
//struct EventParticipantIdAndName: Codable, Identifiable{
//    let id: String
//    let username: String
//    
//    enum CodingKeys: String, CodingKey {
//        case id = "_id", username
//    }
//}

import Foundation

struct EventParticipantModel: Decodable {
    let success: Bool
    let message: EventParticipant
}

struct EventParticipant: Decodable {
    let id: String
    let name: String
    let description: String
    let units: [String]
    let date: String
    let startTime: String
    let endTime: String
    let location: String
    let rules: [String]
    let comments: [String]
    let isPending: Bool
    let isCompleted: Bool
    let isApproved: Bool
    let isRejected: Bool
    let isSuspended: Bool
    let isCancelled: Bool
    let pendingParticipantList: [Participant]?
    let participantList: [Participant]?
    let organizerList: [Participant]
    let creatorId: String
    let createdAt: String
    let updatedAt: String
    let v: Int
    let creator: Participant
    
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, description, units, date, startTime, endTime, location, rules, comments, isPending, isCompleted, isApproved, isRejected, isSuspended, isCancelled, pendingParticipantList, participantList, organizerList, creatorId, createdAt, updatedAt
        case v = "__v"
        case creator
    }
}

struct Participant: Decodable {
    let id: String
    let username: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case username
    }
}
