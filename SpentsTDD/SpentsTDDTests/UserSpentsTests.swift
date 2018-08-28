//
//  UserSpentsTests.swift
//  SpentsTDDTests
//
//  Created by Matheus Garcia on 28/08/18.
//  Copyright © 2018 Matheus Garcia. All rights reserved.
//

import XCTest
@testable import SpentsTDD

class UserSpentsTests: XCTestCase {
    
    var spent00: Spent!
    var spent01: Spent!
    var spent02: Spent!

    override func setUp() {
        super.setUp()

        spent00 = Spent("Bandeco", 3.0, "Refeição no RU da Unicamp")
        spent01 = Spent("Bardana", 16.50, "Open parmegiana")
        spent02 = Spent("Dog Central", 11.50, "Entrega 3 reais!")
    }

    override func tearDown() {
        super.tearDown()
    }

    func testNoSpents() {

        let userSpents = UserSpents()

        XCTAssertEqual(0, userSpents.numberOfSpents())
    }

    func testSpentsAddition() {

        let userSpents = UserSpents()

        XCTAssertEqual(0, userSpents.numberOfSpents())

        userSpents.addSpent(spent00)
        XCTAssertEqual(1, userSpents.numberOfSpents())
        XCTAssertEqual(spent00!, userSpents.spents[0])

        userSpents.addSpent(spent01)
        XCTAssertEqual(2, userSpents.numberOfSpents())
        XCTAssertEqual(spent01!, userSpents.spents[1])

        userSpents.addSpent(spent02)
        XCTAssertEqual(3, userSpents.numberOfSpents())
        XCTAssertEqual(spent02!, userSpents.spents[2])
    }

    func testRemoveSpent() {

        let userSpents = UserSpents()

        XCTAssertEqual(0, userSpents.numberOfSpents())

        userSpents.addSpent(spent00)
        userSpents.addSpent(spent01)
        userSpents.addSpent(spent02)

        do {
            try userSpents.removeSpent(atIndex: 1)
        } catch {
            XCTAssertEqual(nil, error.localizedDescription)
        }

        do {
            try userSpents.removeSpent(atIndex: 3)
        } catch {
            let error = error as? UserSpentsErrors
            XCTAssertEqual(UserSpentsErrors.indexOutOfRange, error)
        }

        XCTAssertEqual(2, userSpents.numberOfSpents())
        XCTAssertEqual(spent00!, userSpents.spents[0])
        XCTAssertEqual(spent02!, userSpents.spents[1])
    }

    func testUserSpentsSelection() {

        let userSpents = UserSpents()

        XCTAssertEqual(0, userSpents.numberOfSpents())

        userSpents.addSpent(spent00)
        userSpents.addSpent(spent01)
        userSpents.addSpent(spent02)

        var wantedSpent: Spent?

        do {
            wantedSpent = try userSpents.getSpent(atIndex: 2)
        } catch {
            XCTAssertEqual(nil, error.localizedDescription)
        }

        XCTAssertEqual(spent02, wantedSpent)

        do {
            wantedSpent = try userSpents.getSpent(atIndex: 5)
        } catch {
            let error = error as? UserSpentsErrors
            XCTAssertEqual(UserSpentsErrors.indexOutOfRange, error)
        }
    }
}
