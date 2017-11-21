//
//  BiggerIsGreater.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 17/05/2016.
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


//https://www.hackerrank.com/challenges/bigger-is-greater
class BiggerIsGreater: NSObject {

    //Copied from http://stackoverflow.com/questions/34968470/calculate-all-permutations-of-a-string-in-swift
    class func possiblePermutations(_ n:Int, a:inout [String], permutations: inout [String]) {
        
        if n == 1 {
            
            permutations.append(a.joined(separator: ""))
            
            return
        }
        
        for i in 0..<n-1 {
            
            possiblePermutations(n-1, a: &a, permutations: &permutations)
            
            swap(&a[n-1], &a[(n%2 == 1) ? 0 : i])
        }
        
        possiblePermutations(n-1, a: &a, permutations: &permutations)
    }
    
    class func permutationGreaterThanOrginal(_ original: String) -> String {
    
        guard original != String(original.characters.reversed()) else {
            
            return "no answer"
        }
        
        var characters = original.characters.map{String($0)}
        
        var maximumValuePermutation: String?
        
        var permutations = [String]()
        
        BiggerIsGreater.possiblePermutations(characters.count, a: &characters, permutations: &permutations)
        
        for permutation in permutations {
            
            if permutation > original {
                
                if maximumValuePermutation == nil {
                    
                    maximumValuePermutation = permutation
                }
                else if maximumValuePermutation > permutation {
                    
                    maximumValuePermutation = permutation
                }
            }
        }
        
        return maximumValuePermutation!
    }
    
    class func permutationGreaterThanOrginalAlt(_ original: String) -> String {
        
        guard original != String(original.characters.reversed()) else {
            
            return "no answer"
        }
        
        var characters = original.characters.map{String($0)}
        
        var permutations = [String]()
        
        BiggerIsGreater.possiblePermutations(characters.count, a: &characters, permutations: &permutations)
        
        let sortedPermutations = permutations.filter{$0 > original}.sorted{$1 > $0}
        
        if sortedPermutations.count > 0 {
            
            return sortedPermutations[0]
        }
        else {
            
            return "no answer"
        }
    }
    
    // MARK: Alt
    
    class func possiblePermutationsAlt(_ n:Int, a:inout [String], original: String, greaterValue: inout String?) {
        
        if n == 1 {
            
            let permutation = a.joined(separator: "")
            
            if permutation > original {
                
                if greaterValue == nil {
                    
                    greaterValue = permutation
                }
                else if greaterValue > permutation {
                    
                    greaterValue = permutation
                }
            }
            
            return
        }
        
        for i in 0..<n-1 {
            
            possiblePermutationsAlt(n-1, a: &a, original: original, greaterValue: &greaterValue)
            
            swap(&a[n-1], &a[(n%2 == 1) ? 0 : i])
        }
        
        possiblePermutationsAlt(n-1, a: &a, original: original, greaterValue: &greaterValue)
    }


}
