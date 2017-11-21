//
//  CavityMap.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 10/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


//https://www.hackerrank.com/challenges/cavity-map
class CavityMap: NSObject {
    
    class func generateCavityMap(_ map: [String]) -> [String] {
        
        let cavity = "X"
        
        var cavityMap = map
        
        if map.count > 2 {
            
            for rowIndex in 1..<(cavityMap.count - 1) {
                
                let row = cavityMap[rowIndex]
                
                var cavityRow = row
                
                for cellIndex in cavityRow.characters.indices {
                    
                    if cellIndex != cavityRow.characters.startIndex && cellIndex != cavityRow.characters.index(cavityRow.characters.endIndex, offsetBy: -1) {
                        
                        let cell = String(cavityRow.characters[cellIndex])
                        
                        let previousCellInRow = String(cavityRow.characters[cavityRow.index(cellIndex, offsetBy: -1)])
                        let nextCellInRow = String(cavityRow.characters[cavityRow.index(cellIndex, offsetBy: 1)])
                        
                        let previousRow = cavityMap[(rowIndex - 1)]
                        let nextRow = cavityMap[(rowIndex + 1)]
                        
                        let cellInPreviousRow = String(previousRow.characters[cellIndex])
                        let cellInNextRow = String(nextRow.characters[cellIndex])
                        
                        if !(cell == cavity || previousCellInRow == cavity || nextCellInRow == cavity || cellInPreviousRow == cavity || cellInNextRow == cavity) {
                            
                            if Int(cell) > Int(previousCellInRow) && Int(cell) > Int(nextCellInRow) && Int(cell) > Int(cellInPreviousRow) && Int(cell) > Int(cellInNextRow){
                                
                                cavityRow.replaceSubrange(cellIndex..<cavityRow.index(cellIndex, offsetBy: 1), with: cavity)
                            }
                        }
                    }
                }
                
                cavityMap[rowIndex] = cavityRow
            }

        }
        
        return cavityMap
    }
}
