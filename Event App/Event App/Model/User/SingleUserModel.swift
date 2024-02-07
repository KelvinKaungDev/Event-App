import Foundation

struct SingleUserModel: Codable {
    let success: Bool
    let message: User
}

// MARK: - Message
struct User: Codable {
    let id, messageID, username, firstName: String
    let units: [String]?
//    let isOrganizer: Bool?
    let organisingList: [JSONAny]?
//    let isParticipant: Bool?
    let participatingList, history: [JSONAny]?
    let email: String?
    let phoneNumber: Int
    let age: Int
    let eventList: [JSONAny]?
    let createdAt, updatedAt: String
    let pendingEventList, participatingEventList, participatedEventList, approvedParticipantList, rejectedParticipantList: [String]?
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case messageID = "id"
        case username, firstName, units, organisingList, participatingList, history, email, phoneNumber, age, eventList, createdAt, updatedAt
        case pendingEventList, participatingEventList, participatedEventList, approvedParticipantList, rejectedParticipantList
        case v = "__v"
    }
}

