//
//  LifeCycleTests.swift
//  UnitTestingTests
//
//  Created by Yusef Naser on 07/09/2021.
//

import XCTest
@testable import UnitTesting

class LifeCycleTests: XCTestCase {

    private var sut: LifeCycle!
    override func setUp() {
        super.setUp()
        sut = LifeCycle()
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    func test_methodOne() {
        sut.methodOne()
    // Normally, assert something
    }
    func test_methodTwo() {
        sut.methodTwo()
    // Normally, assert something
    }

}
