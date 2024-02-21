//
//  SingleEventModel.swift
//  Event App
//
//  Created by Austin Xu on 2024/2/21.
//

import Foundation

struct SingleEventModel: Codable {
    let success: Bool
    let message: Event
}

// MARK: - Message
struct Event: Codable {
    let id, name, description: String
    let units: [String]
    let date, startTime, endTime: String
    let location: String
    let rules, comments: [JSONAny]
    let isPending, isCompleted, isApproved, isRejected: Bool
    let isSuspended, isCancelled: Bool
    let pendingParticipantList: [String]
    
    // I change JSONAny to String for participantList
    let participantList: [String]
    let organizerList: [String]
    let creatorID, createdAt, updatedAt: String
    let v: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, description, units, date, startTime, endTime, location, rules, comments, isPending, isCompleted, isApproved, isRejected, isSuspended, isCancelled, pendingParticipantList, participantList, organizerList
        case creatorID = "creatorId"
        case createdAt, updatedAt
        case v = "__v"
    }
    
    
}

