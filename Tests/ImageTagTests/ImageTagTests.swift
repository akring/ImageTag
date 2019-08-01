import XCTest
@testable import ImageTag

final class ImageTagTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ImageTag().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
