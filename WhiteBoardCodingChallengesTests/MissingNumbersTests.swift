//
//  MissingNumbersTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 12/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class MissingNumbersTests: XCTestCase {
    
    // MARK: Tests
    
    func test_missingNumbersA() {
        let incomplete = [203, 204, 205, 206, 207, 208, 203, 204, 205, 206]
        let complete = [203, 204, 204, 205, 206, 207, 205, 208, 203, 206, 205, 206, 204]
        
        let missing = MissingNumbers.missingNumbers(complete, incomplete: incomplete)
        
        XCTAssertEqual([204, 205, 206], missing)
    }
}
