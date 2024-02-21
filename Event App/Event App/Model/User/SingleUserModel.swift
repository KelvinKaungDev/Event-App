import Foundation

struct SingleUserModel: Codable {
    let success: Bool
    let message: User
}

// MARK: - Message
//struct User: Codable {
//    let id, messageID, username, firstName: String
//    let units: [String]?
////    let isOrganizer: Bool?
//    let organisingList: [JSONAny]?
////    let isParticipant: Bool?
//    let participatingList, history: [JSONAny]?
//    let email: String?
//    let phoneNumber: Int
//    let age: Int
//    let eventList: [JSONAny]?
//    let createdAt, updatedAt: String
//    let pendingEventList, participatingEventList, participatedEventList, approvedParticipantList, rejectedParticipantList: [String]?
//    let v: Int
//
//    enum CodingKeys: String, CodingKey {
//        case id = "_id"
//        case messageID = "id"
//        case username, firstName, units, organisingList, participatingList, history, email, phoneNumber, age, eventList, createdAt, updatedAt
//        case pendingEventList, participatingEventList, participatedEventList, approvedParticipantList, rejectedParticipantList
//        case v = "__v"
//    }
//}
//


// MARK: - Message
struct User: Codable {
    let id, messageID, username, firstName: String
    let units: [String]?
    let email: String
    let createdEventList, organisingEventList, pendingEventList: [String]?
    let participatingEventList, participatedEventList, log: [String]?
    let createdAt, updatedAt: String
    let v: Int
    let eventHistoryList, organizedEventList: [String]?
    let approvedParticipantList: [ApprovedParticipantList]?
    let kickedParticipantList, rejectedParticipantList: [String]?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case messageID = "id"
        case username, firstName, units, email, createdEventList, organisingEventList, pendingEventList, participatingEventList, participatedEventList, log, createdAt, updatedAt
        case v = "__v"
        case eventHistoryList, organizedEventList, approvedParticipantList, kickedParticipantList, rejectedParticipantList
    }
}

struct ApprovedParticipantList: Codable {
    let participantID, eventID, id: String

    enum CodingKeys: String, CodingKey {
        case participantID = "participantId"
        case eventID = "eventId"
        case id = "_id"
    }
}
