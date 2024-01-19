import Foundation

struct SinglUnitModel: Codable {
    let success: Bool
    let message: [Unit]
}

// MARK: - Message
struct Message: Codable {
    let id, name, description: String
    let eventList: [JSONAny]
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, description, eventList
        case v = "__v"
    }
}

