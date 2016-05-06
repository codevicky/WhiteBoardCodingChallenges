//
//  AlphabeticalOrdering.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 06/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class AlphabeticalOrdering: NSObject {

    class func sort(string: String) -> String {
        
        let seperateWords = string.characters.split(" ").map(String.init)
        
        let sortedWords = seperateWords.sort({ (i: String, j: String) -> Bool in
            
            var shortestWord: String
            
            if i.characters.count > j.characters.count {
                shortestWord = j
            }
            else {
                shortestWord = i
            }
            
            /*----------------*/
            
            for index in shortestWord.characters.indices {
                
                let iCharacter = i[index]
                let jCharacter = j[index]
                
                if iCharacter > jCharacter {
                    
                    return false
                }
                else if jCharacter > iCharacter {
                    
                    return true
                }
            }
            
            /*----------------*/
            
            if i.characters.count > j.characters.count {
                
                return false
            }
            else {
                
                return true
            }
        })
        
        return sortedWords.joinWithSeparator(" ")
    }
}
