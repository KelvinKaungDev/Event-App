import Foundation

// MARK: - Welcome
struct AdminGetOneModel: Codable {
    let success: Bool
    let message: SingleAdmin
}

// MARK: - Message
struct SingleAdmin: Codable {
    let id, messageID, username, firstName: String
    let units: [String]
    let email: String
    let garantedEventList, rejectedEventList, activities: [JSONAny]
    let createdAt, updatedAt: String
    let v: Int
    let approvedEventList, cancelledEventList, createdEventList, log: [JSONAny]
    let organisingList, participatedEventList, participatingEventList, pendingEventList: [JSONAny]
    let suspendedEventList: [JSONAny]

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case messageID = "id"
        case username, firstName, units, email, garantedEventList, rejectedEventList, activities, createdAt, updatedAt
        case v = "__v"
        case approvedEventList, cancelledEventList, createdEventList, log, organisingList, participatedEventList, participatingEventList, pendingEventList, suspendedEventList
    }
}
