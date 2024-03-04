

import Foundation
import Alamofire


struct GetAllEventsByUserIdModel: Codable {
    let success: Bool
    let message: AllEvents
}

struct AllEvents: Codable {
    let createdEventList, organisingEventList, organizedEventList, pendingEventList, participatingEventList, participatedEventList: [EventList]?
}

// MARK: - EventList
struct EventList: Codable, Identifiable {
    let id: String
    let name, description: String
    let units: [EventUnit]
    let date, startTime, endTime: String
    let location: String
    let isPending, isCompleted, isApproved, isRejected, isSuspended, isCancelled: Bool
    let pendingParticipantList, participantList: [String]?
    let organizerList: [String]
    let creatorId: String
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id = "_id", name, description, units, date, startTime, endTime, location, isPending, isCompleted, isApproved, isRejected, isSuspended, isCancelled, pendingParticipantList, participantList, organizerList, creatorId, createdAt, updatedAt
    }
}



struct EventUnit: Codable, Identifiable {
    let id: String
    let name, description: String

    enum CodingKeys: String, CodingKey {
        case id = "_id", name, description
    }
}
