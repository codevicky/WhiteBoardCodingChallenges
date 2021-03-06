//
//  InsertionSortTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by Boles on 15/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class InsertionSortTests: XCTestCase {
    
    // MARK: RightMost
    
    func test_insertionSortRightMostA() {
        
        let steps = InsertionSort.sortRightMostElementIntoCorrectPosition([2, 4, 6, 8, 3])
        
        let expectedSteps = [[2, 4, 6, 8, 8],
                             [2, 4, 6, 6, 8],
                             [2, 4, 4, 6, 8],
                             [2, 3, 4, 6, 8]]
        
        XCTAssertEqual(expectedSteps as NSArray, steps as NSArray)
    }
    
    // MARK: All
    
    func test_insertionSortAllA() {
        
        let steps = InsertionSort.sort([1, 4, 3, 5, 6, 2])
        
        let expectedSteps = [[1, 4, 3, 5, 6, 2],
                             [1, 3, 4, 5, 6, 2],
                             [1, 3, 4, 5, 6, 2],
                             [1, 3, 4, 5, 6, 2],
                             [1, 2, 3, 4, 5, 6]]
        
        XCTAssertEqual(expectedSteps as NSArray, steps as NSArray)
    }
    
    func test_insertionSortAllB() {
        
        let steps = InsertionSort.sort([9, 8, 6, 7, 3, 5, 4, 1, 2])
        
        let expectedSteps = [[8, 9, 6, 7, 3, 5, 4, 1, 2],
                             [6, 8, 9, 7, 3, 5, 4, 1, 2],
                             [6, 7, 8, 9, 3, 5, 4, 1, 2],
                             [3, 6, 7, 8, 9, 5, 4, 1, 2],
                             [3, 5, 6, 7, 8, 9, 4, 1, 2],
                             [3, 4, 5, 6, 7, 8, 9, 1, 2],
                             [1, 3, 4, 5, 6, 7, 8, 9, 2],
                             [1, 2, 3, 4, 5, 6, 7, 8, 9]]
        
        XCTAssertEqual(expectedSteps as NSArray, steps as NSArray)
    }
    
    // MARK: NumberOfShifts
    
    func test_numberOfShiftsA() {
        
        let numberOfShifts = InsertionSort.numberOfShiftsToSort([2, 1, 3, 1, 2])
        
        XCTAssertEqual(4, numberOfShifts)
    }
    
}
