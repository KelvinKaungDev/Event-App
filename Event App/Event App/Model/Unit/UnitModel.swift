import Foundation

struct UnitModel: Codable {
    let success: Bool
    let message: [Units]
}

// MARK: - Message
struct Units: Codable {
    let id, name, description: String
    let eventList: [JSONAny]
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, description, eventList
        case v = "__v"
    }
}
