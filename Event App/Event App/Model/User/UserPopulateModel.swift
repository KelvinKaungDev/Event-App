import Foundation
import SwiftUI

// MARK: - Welcome
struct UserPopulateModel: Codable {
    let success: Bool
    let message: Populate
}

// MARK: - Message
struct Populate: Codable {
    let id, messageID, username, firstName: String
    let units: [Unit]
    let isOrganizer: Bool
    let createdEventList, organisingList: [JSONAny]
    let isParticipant: Bool
    let participatingList, history: [JSONAny]
    let email: String
    let eventList: [JSONAny]
    let createdAt, updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case messageID = "id"
        case username, firstName, units, isOrganizer, createdEventList, organisingList, isParticipant, participatingList, history, email, eventList, createdAt, updatedAt
        case v = "__v"
    }
}
