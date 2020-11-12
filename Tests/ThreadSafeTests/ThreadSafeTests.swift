import XCTest
@testable import ThreadSafe

final class ThreadSafeTests: XCTestCase {
    func testConcurrentAccess() {
        let value = ThreadSafe(value: 0)

        let expect = expectation(description: "wait")
        DispatchQueue.global().async {
            DispatchQueue.concurrentPerform(iterations: 1_000) { _ in
                value.write {
                    $0 += 1
                }
            }
            expect.fulfill()
        }

        waitForExpectations(timeout: 10) { _ in
            value.read {
                XCTAssertEqual($0, 1_000)
            }
        }
    }
}
