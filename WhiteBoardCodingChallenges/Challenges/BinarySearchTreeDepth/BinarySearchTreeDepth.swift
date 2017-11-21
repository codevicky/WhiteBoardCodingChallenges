//
//  BinarySearchTreeDepth.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 01/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//CtCI 4.3
class BinarySearchTreeDepth: NSObject {
    
    // MARK: Properties
    
    var root: BinarySearchTreeDepthNode?
    
    // MARK: Add
    
    func addValue(_ value: Int) {
        
        if root == nil {
            
            self.root = BinarySearchTreeDepthNode.init(value: value, depth: 0)
        }
        else {
            
            addValue(value, root: root!)
        }
    }
    
    fileprivate func addValue(_ value: Int, root: BinarySearchTreeDepthNode) {
        
        if value <= root.value {
            
            if root.left == nil {
                
                root.left = BinarySearchTreeDepthNode.init(value: value, depth: root.depth+1)
            }
            else {
                
                addValue(value, root: root.left!)
            }
        }
        else {
            
            if root.right == nil {
                
                root.right = BinarySearchTreeDepthNode.init(value: value, depth: root.depth+1)
            }
            else {
                
                addValue(value, root: root.right!)
            }
        }
    }
    
    // MARK: Visit
    
    fileprivate func visited(_ node: BinarySearchTreeDepthNode, nodesVisted: inout [BinarySearchTreeDepthLinkedList]) {
        
        let depth = node.depth
        
        var list: BinarySearchTreeDepthLinkedList
        
        if depth > (nodesVisted.count - 1) {
            
            list = BinarySearchTreeDepthLinkedList()
            nodesVisted.append(list)
        }
        else {
            
            list = nodesVisted[node.depth]
        }
        
        list.addNode(node)
    }
    
    // MARK: Depth
    
    func nodesInDepth() -> [BinarySearchTreeDepthLinkedList] {
        
        var nodesVisited = [BinarySearchTreeDepthLinkedList]()
        
        nodesInDepth(root, nodesVisted: &nodesVisited)
        
        return nodesVisited
    }
    
    fileprivate func nodesInDepth(_ root: BinarySearchTreeDepthNode?, nodesVisted: inout [BinarySearchTreeDepthLinkedList]) {
        
        if let root = root {
            
            visited(root, nodesVisted: &nodesVisted)
            
            nodesInDepth(root.left, nodesVisted: &nodesVisted)
            nodesInDepth(root.right, nodesVisted: &nodesVisted)
        }
    }
}
