import Foundation

// MARK: - Welcome
struct AdminModel: Codable {
    let success: Bool
    let message: [Admin]
}

// MARK: - Message
struct Admin: Codable {
    let id, messageID, username, firstName: String
    let units: [String]
    let email: String
    let garantedEventList, rejectedEventList, activities: [JSONAny]
    let createdAt, updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case messageID = "id"
        case username, firstName, units, email, garantedEventList, rejectedEventList, activities, createdAt, updatedAt
        case v = "__v"
    }
}
