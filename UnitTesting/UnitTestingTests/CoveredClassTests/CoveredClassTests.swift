//
//  CoveredClassTests.swift
//  UnitTestingTests
//
//  Created by Yusef Naser on 08/09/2021.
//

import XCTest
@testable import UnitTesting

class CoveredClassTests: XCTestCase {
    
//    func test_max_with1And2_shouldReturnSomething() {
//        let result = CoveredClass.max(1, 2)
//        XCTAssertEqual(result, -123)
//    }

    func test_max_with1And2_shouldReturn2() {
        let result = CoveredClass.max(1, 2)
        XCTAssertEqual(result, 2)
    }
    
    func test_max_with3And2_shouldReturn3() {
        let result = CoveredClass.max(3, 2)
        XCTAssertEqual(result, 3)
    }
    
//    func test_commaSeparated_from2to4_shouldReturn234SeparatedByCommas() {
//        let result = CoveredClass.commaSeparated(from: 2, to: 4)
//        XCTAssertEqual(result, "2,3,4")
//    }
    
    func test_commaSeparated_from2to2_shouldReturnSomething() {
        let result = CoveredClass.commaSeparated(from: 2, to: 2)
        XCTAssertEqual(result, "2")
    }
    
    func test_area_withWidth7_shouldBe49() {
        let sut = CoveredClass()
        sut.width = 7
        XCTAssertEqual(sut.area, 49)
    }
    
}
