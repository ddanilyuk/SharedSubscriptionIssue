//
//  TestSharedSubscriptionTests.swift
//  TestSharedSubscriptionTests
//
//  Created by Denys Danyliuk on 22.10.2024.
//

import XCTest
@testable import TestSharedSubscription
import ComposableArchitecture
import Combine

final class TestSharedSubscriptionTests: XCTestCase {
    func testSharedSubscription() throws {
        @Dependency(\.defaultAppStorage) var defaults
        var cancellable: (any Cancellable)?
        @Shared(.appStorage("testInt")) var testInt: Int = 0
        var isUpdated = false
        cancellable = $testInt.publisher.sink { _ in
            isUpdated = true
        }
        defaults.set(42, forKey: "randomDefaultsKey")
        XCTAssert(!isUpdated)
        _ = cancellable
    }
}
