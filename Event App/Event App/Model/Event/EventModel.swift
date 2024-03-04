import Foundation

struct EventModel: Codable {
    let success: Bool
    let message: [Events]
}

// MARK: - Message
struct Events: Codable{
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


extension Events: Hashable {
    static func == (lhs: Events, rhs: Events) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        // Add any other properties you consider essential for uniqueness
        // For complex properties that don't easily conform to Hashable, you might exclude them
        // or find a simple representative value to hash.
    }
}
