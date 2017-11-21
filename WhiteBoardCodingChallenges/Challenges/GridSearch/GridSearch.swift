//
//  GridSearch.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 09/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//https://www.hackerrank.com/challenges/the-grid-search
class GridSearch: NSObject {

    class func gridContainsPattern(_ grid: [String], pattern: [String]) -> Bool {
     
        for index in 0..<grid.count {
            
            let row = grid[index]
            
            if grid.count >= (index + pattern.count) {
                
                if row.contains(pattern[0]) {
                    
                    let rangesOfFirstPattern = GridSearch.rangeOfAllOccurrancesOfPatternInRow(row, pattern: pattern[0])
                    
                    let newPattern = pattern[1..<pattern.count].map{$0}
                    let newGrid = grid[(index+1)..<grid.count].map{$0}
                    
                    for range in rangesOfFirstPattern {
                        
                        if GridSearch.doesContainPatternMatchingRange(newGrid, pattern: newPattern, range: range) {
                            
                            return true
                        }
                    }
                }
            }
        }
        
        return false
    }
    
    class func doesContainPatternMatchingRange(_ grid: [String], pattern: [String], range: Range<String.Index>) -> Bool {
        
        let patternRange = grid[0].range(of: pattern[0], options: NSString.CompareOptions.caseInsensitive, range: range, locale: nil)
        
        if patternRange != nil {
            
            let newPattern = pattern[1..<pattern.count].map{$0}
            let newGrid = grid[1..<grid.count].map{$0}
            
            if newPattern.count > 0 {
            
                return GridSearch.doesContainPatternMatchingRange(newGrid, pattern: newPattern, range: range)
            }
            else {
                
                return true
            }
        }
        
        return false
    }
    
    class func rangeOfAllOccurrancesOfPatternInRow(_ row: String, pattern: String) -> [Range<String.Index>] {
        
        var occurrances = [Range<String.Index>]()
        
        if row.contains(pattern) {
            
            let patternCharacterCount = pattern.characters.count
            let limit = row.characters.endIndex
            
            for index in row.characters.indices {
                guard let upperIndex = row.characters.index(index, offsetBy: patternCharacterCount, limitedBy: limit) else {
                    continue
                }
                
                let range = index..<upperIndex
                
                let patternRange = row.range(of: pattern, options: NSString.CompareOptions.caseInsensitive, range:range, locale: nil)
                
                if let patternRange = patternRange {
                    
                    occurrances.append(patternRange)
                }
            }
        }

        return occurrances
    }
}
