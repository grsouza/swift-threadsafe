import XCTest

import ThreadSafeTests

var tests = [XCTestCaseEntry]()
tests += ThreadSafeTests.__allTests()

XCTMain(tests)
