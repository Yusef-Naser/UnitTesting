//
//  LifeCycleTests.swift
//  UnitTestingTests
//
//  Created by Yusef Naser on 07/09/2021.
//

import XCTest
@testable import UnitTesting

class LifeCycleTests: XCTestCase {

    func test_methodOne() {
        let sut = LifeCycle()
        sut.methodOne()
        XCTFail("faild, yo")
    }
    
    func test_methodTwo() {
        let sut = LifeCycle()
        sut.methodTwo()
        // Normally, assert something
    }

}
