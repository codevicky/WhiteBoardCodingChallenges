//
//  PalindromeTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 06/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class PalindromeTests: XCTestCase {
    
    // MARK: TestLifecycle
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    // MARK: Tests
    
    func test_isPalindromeTrue() {
        
        let string = "toaoT"
        
        let isPalindrome = Palindrome.isPalindrome(string)
        
        XCTAssertTrue(isPalindrome, "Should be true")
    }
    
    func test_isPalindromeFalse() {
        
        let string = "bananana"
        
        let isPalindrome = Palindrome.isPalindrome(string)
        
        XCTAssertFalse(isPalindrome, "Should be false")
    }
    
}
