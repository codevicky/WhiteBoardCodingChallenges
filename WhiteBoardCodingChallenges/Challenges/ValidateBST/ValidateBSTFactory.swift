//
//  ValidateBSTFactory.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 02/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class ValidateBSTFactory: NSObject {

    // MARK: Build
    
    class func buildBinaryTree(_ relationships: [[Int]]) -> ValidateBSTNode {
        
        var nodes = [Int: ValidateBSTNode]()
        
        for relationship in relationships {
            let parentNodeValue = relationship[0]
            let childNodeValue = relationship[1]
            
            var parentNode = nodes[parentNodeValue]
            var childNode = nodes[childNodeValue]
            
            if parentNode == nil {
                parentNode = ValidateBSTNode(value: parentNodeValue)
                nodes[parentNodeValue] = parentNode
            }
            
            if childNode == nil {
                childNode = ValidateBSTNode(value: childNodeValue)
                nodes[childNodeValue] = childNode
            }
            
            parentNode!.addNodeAsChild(childNode!)
        }
        
        return rootNode(nodes)
    }
    
    class func rootNode(_ nodes: [Int: ValidateBSTNode]) -> ValidateBSTNode {
        var rootNode: ValidateBSTNode?
        
        for node in nodes.values {
            if node.parent == nil {
                rootNode = node
                break
            }
        }
        
        return rootNode!
    }
}
