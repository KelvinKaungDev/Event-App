import Foundation

// MARK: - Welcome
struct UserModel: Codable {
    let success: Bool
    let message: [Users]
}

// MARK: - Message
struct Users: Codable {
    let id, messageID, username, firstName: String?
    let units: [String]
    let isOrganizer: Bool?
    let organisingList: [JSONAny]?
    let isParticipant: Bool?
    let participatingList, history: [JSONAny]?
    let email: String?
    let eventList: [JSONAny]?
    let createdAt, updatedAt: String?
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case messageID = "id"
        case username, firstName, units, isOrganizer, organisingList, isParticipant, participatingList, history, email, eventList, createdAt, updatedAt
        case v = "__v"
    }
}
