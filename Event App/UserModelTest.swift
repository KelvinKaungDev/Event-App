import XCTest
@testable import Event_App

final class UserModelTest: XCTestCase {
    
    func test_get_all_user() throws {
        guard let path =  Bundle(for: type(of: self)).path(forResource: "allUser", ofType: "json") else { fatalError("Json Not Found") }
        guard let json = try? String(contentsOfFile: path, encoding: .utf8) else { return }
        let jsonData =  json.data(using: .utf8)!
        let adminData = try! JSONDecoder().decode(UserModel.self, from: jsonData)
        XCTAssertEqual("User1", adminData.message[0].username)
    }
    
    func test_get_single_user() throws {
        guard let path =  Bundle(for: type(of: self)).path(forResource: "singleUser", ofType: "json") else { fatalError("Json Not Found") }
        guard let json = try? String(contentsOfFile: path, encoding: .utf8) else { return }
        let jsonData =  json.data(using: .utf8)!
    }
}
