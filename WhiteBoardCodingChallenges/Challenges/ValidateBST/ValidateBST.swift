//
//  ValidateBST.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 02/07/2016.
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
fileprivate func <= <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l <= r
  default:
    return !(rhs < lhs)
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


//CtCI 4.5
class ValidateBST: NSObject {
    
    // MARK: InOrder
    
    class func inOrderTraversalIsBST(_ root: ValidateBSTNode) -> Bool {
        var order = [ValidateBSTNode]()
        inOrderTraversal(root, order: &order)
        
        for i in 1..<order.count {
            if order[i-1].value > order[i].value {
                return false
            }
        }
        
        return true
    }
    
    class func inOrderTraversal(_ root: ValidateBSTNode?, order: inout [ValidateBSTNode]) {
        if let root = root {
            inOrderTraversal(root.left, order: &order)
            order.append(root)
            inOrderTraversal(root.right, order: &order)
        }
    }
    
    // MARK: MaxMin
    
    class func maxMinIsBST(_ root: ValidateBSTNode) -> Bool {
        
        return maxMinIsBST(root, min: nil, max: nil)
    }
    
    class func maxMinIsBST(_ root: ValidateBSTNode?, min: Int?, max: Int?) -> Bool {
        guard let root = root else {
            return true
        }
        
        if (min != nil && root.value <= min) || (max != nil && root.value > max) {
            return false
        }
        
        if !maxMinIsBST(root.left, min: min, max: root.value) || !maxMinIsBST(root.right, min: root.value, max: max) {
            return false
        }
        
        return true
    }
}
