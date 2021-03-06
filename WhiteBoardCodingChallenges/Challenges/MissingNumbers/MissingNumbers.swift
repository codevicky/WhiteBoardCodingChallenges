//
//  MissingNumbers.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 12/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class MissingNumbers: NSObject {

    // MARK: Missing
    
    class func missingNumbers(_ complete: [Int], incomplete: [Int]) -> [Int] {
        var occurrences = [Int: Int]()
        
        for i in 0..<complete.count {
            let completeValue = complete[i]
            if let existingCount = occurrences[completeValue] {
                occurrences[completeValue] = existingCount+1
            } else {
                occurrences[completeValue] = 1
            }
            
            if i < incomplete.count {
                let incompleteValue = incomplete[i]
                if let existingCount = occurrences[incompleteValue] {
                    occurrences[incompleteValue] = existingCount-1
                } else {
                    occurrences[incompleteValue] = -1
                }
            }
        }
        
        var missing = [Int]()
        for key in occurrences.keys {
            if occurrences[key] != 0 {
                missing.append(key)
            }
        }
        
        return missing.sorted(by: { (a, b) -> Bool in
            return b > a
        })
    }
}
