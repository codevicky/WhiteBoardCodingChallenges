//
//  KaprekarTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 12/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class KaprekarTests: XCTestCase {
    
    // MARK: Tests
    
    func test_kaprekarA() {
        
        let range = Kaprekar.kaprekarRange(1, upperBounds: 100)
        
        XCTAssertEqual([1, 9, 45, 55, 99], range)
    }
    
    func test_kaprekarB() {
        
        let range = Kaprekar.kaprekarRange(297, upperBounds: 300)
        
        XCTAssertEqual([297], range)
    }
    
}
