//
//  Palindrome.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 06/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class Palindrome: NSObject {

    class func isPalindrome(_ string: String) -> Bool {
        
        if string.characters.count < 2 {
            
            return false
        }
        
        let lowercaseString = string.lowercased()
        
        var lowerIndex = lowercaseString.startIndex
        var upperIndex = lowercaseString.characters.index(lowercaseString.endIndex, offsetBy: -1)
        
        while lowerIndex < upperIndex {
            
            if lowercaseString[lowerIndex] != lowercaseString[upperIndex] {
                
                return false
            }
            
            lowerIndex = string.index(lowerIndex, offsetBy: 1)
            upperIndex = string.index(upperIndex, offsetBy: -1)
        }
        
        return true
    }
}
