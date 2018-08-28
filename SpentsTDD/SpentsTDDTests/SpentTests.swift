//
//  SpentTests.swift
//  SpentsTDDTests
//
//  Created by Matheus Garcia on 28/08/18.
//  Copyright © 2018 Matheus Garcia. All rights reserved.
//

import XCTest
@testable import SpentsTDD

class SpentTests: XCTestCase {

    var spentName: String!
    var spentValue: Double!
    var spentDescription: String?

    override func setUp() {
        super.setUp()

        spentName = "Bandeco"
        spentValue = 3.0
        spentDescription = "Refeição no RU da Unicamp"
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testAddNewSpent() {

        let spent = Spent(spentName, spentValue, spentDescription)

        XCTAssertEqual("Bandeco", spent.name)
        XCTAssertEqual(3.0, spent.value)
        XCTAssertEqual("Refeição no RU da Unicamp", spent.description)
    }
    
    func testIfDontPassDescription() {

        let spent = Spent(spentName, spentValue)

        XCTAssertEqual("Bandeco", spent.name)
        XCTAssertEqual(3.0, spent.value)
        XCTAssertEqual(nil, spent.description)
    }

    func testEdit() {

        let spent = Spent(spentName, spentValue, spentDescription)

        let newName = "Bardana"
        let newValue = 16.50
        let newDescription = "Open parmegiana"

        spent.edit(newName, newValue, newDescription)

        XCTAssertEqual(newName, spent.name)
        XCTAssertEqual(newValue, spent.value)
        XCTAssertEqual(newDescription, spent.description)
    }

    func testRemoveDescription() {

        let spent = Spent(spentName, spentValue, spentDescription)

        let newName = "Bardana"
        let newValue = 16.50
        let newDescription: String? = nil

        spent.edit(newName, newValue, newDescription)

        XCTAssertEqual(newName, spent.name)
        XCTAssertEqual(newValue, spent.value)
        XCTAssertEqual(newDescription, spent.description)
    }
}
