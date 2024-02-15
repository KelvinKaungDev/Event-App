import Foundation

// MARK: - Welcome
struct UserPopulateEventListModel: Codable {
    let success: Bool
    let message: PopulateEventList
}

// MARK: - Message
struct PopulateEventList: Codable {
    let id, messageID, username, firstName: String
    let units: [String]
//    let isOrganizer: Bool
//    let createdEventList, organisingList: [JSONAny]
    let createdEventList, organisingEventList, organizedEventList, pendingEventList, participatingEventList, participatedEventList: [Events]?
//    let isParticipant: Bool
//    let participatingEventList, history: [JSONAny]
    let email: String
//    let eventList: [JSONAny]
    let createdAt, updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case messageID = "id"
        case username, firstName, units, createdEventList, organisingEventList, organizedEventList, pendingEventList, participatingEventList, participatedEventList, email, createdAt, updatedAt
        case v = "__v"
    }
}
