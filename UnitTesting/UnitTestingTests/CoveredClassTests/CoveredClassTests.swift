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
    
}
