import XCTest
@testable import Event_App

final class EventModelTest: XCTestCase {
    func test_get_all_event() throws {
        let event = EventViewModel()
        event.fetchEvents { events in
            XCTAssertEqual("test", events[0].description)
        }
    }
}
