//
//  BuildOrderTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 02/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class ProjectBuildOrderTests: XCTestCase {
    
    // MARK: Tests
    
    func test_projectBuildOrderA() {
        
        let projects = ["a", "b", "c", "d", "e", "f"]
        let dependencies = [["a", "d"], ["f", "b"], ["b", "d"], ["f", "a"], ["d", "c"]]
        
        let buildOrder = ProjectBuildOrder.buildOrder(projects, dependencies: dependencies)
        
        for node in buildOrder! {
            
            print(node.value)
        }
        
        XCTAssertNotNil(buildOrder)
    }
    
}
