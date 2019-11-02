//
//  KeychainWrapperDemoTests.swift
//  KeychainWrapperDemoTests
//
//  Created by Marcus Kida on 02.11.19.
//  Copyright © 2019 Bearologics UG (haftungsbeschränkt). All rights reserved.
//

import XCTest
@testable import KeychainWrapperDemo

class KeychainWrapperDemoTests: XCTestCase {
    
    var sut: KeychainWrapper!

    override func setUp() {
        sut = KeychainWrapper(service: "myApp")
    }

    override func tearDown() {
        sut = nil
    }

    func testCreatesPassword() {
        XCTAssert(sut.set("pass", forKey: "user"))
        XCTAssert(sut.get(stringForKey: "user") == "pass")
    }
    
    func testUpdatesPassword() {
        XCTAssert(sut.set("pass", forKey: "user"))
        XCTAssert(sut.get(stringForKey: "user") == "pass")

        XCTAssert(sut.set("pass2", forKey: "user"))
        XCTAssert(sut.get(stringForKey: "user") == "pass2")
    }

    func testRetrievesPassword() {
        XCTAssert(sut.set("pass", forKey: "user"))
        XCTAssert(sut.get(stringForKey: "user") == "pass")
    }
    
    func testDeletesPassword() {
        XCTAssert(sut.del(valueForKey: "user"))
    }
}
