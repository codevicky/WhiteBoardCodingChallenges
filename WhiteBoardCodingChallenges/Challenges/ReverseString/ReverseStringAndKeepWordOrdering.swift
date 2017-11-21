//
//  ReverseStringA.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 06/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class ReverseStringAndKeepWordOrdering: NSObject {

    
    class func reverse(_ string: String) -> String {
        
        let seperateWords = string.characters.split(separator: " ").map(String.init)
        
        var reversedSentence = [String]()
        
        for word in seperateWords {
            
            reversedSentence.append(String(word.characters.reversed()))
        }
        
        return reversedSentence.joined(separator: " ")
    }
}
