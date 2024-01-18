import Foundation
struct EventModel: Codable {
    let success: Bool
    let message: [Events]
}

// MARK: - Message
struct Events: Codable {
    let id, name, description: String
    let units: [String]
    let date, startTime, endTime: Date
    let location: String
    let rules, comments: [JSONAny]
    let isPending, isCompleted, isApproved, isRejected: Bool
    let isSuspended, isCancelled: Bool
    let pendingParticipantList: [String]
    let participantList: [JSONAny]
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

