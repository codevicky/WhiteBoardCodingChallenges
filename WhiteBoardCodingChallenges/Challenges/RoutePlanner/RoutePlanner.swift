//
//  RoutePlanner.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 01/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//CtCI 4.1
class RoutePlanner: NSObject {

    // MARK: Properties
    
    var nodes: [RoutePlannerNode]?
    
    // MARK: Nodes
    
    func addNode(_ node: RoutePlannerNode) {
        
        nodes?.append(node)
    }
    
    // MARK: Path
    
    func pathExistsBetweenNodes(_ source: RoutePlannerNode, destination: RoutePlannerNode) -> Bool {
        
        let queue = RoutePlannerQueue()
        
        queue.enqueue(source)
        
        while !queue.isEmpty() {
            
            let node = queue.dequeue()
            
            if node == destination {
                
                return true
            }
            else {
                
                for connectionNode in node.connectedNodes {
                    
                    if !connectionNode.visited {
                        
                        connectionNode.visited = true
                        
                        queue.enqueue(connectionNode)
                    }
                }
            }
        }
        
        return false
    }
    
    func pathBetweenNodes(_ source: RoutePlannerNode, destination: RoutePlannerNode) -> [RoutePlannerNode]? {
        
        let queue = RoutePlannerQueue()
        
        queue.enqueue(source)
        
        while !queue.isEmpty() {
            
            let node = queue.dequeue()
            
            if node == destination {
                
                var previousNode: RoutePlannerNode?
                
                var path = [node]
                
                previousNode = node
                
                while previousNode != source {
                    
                    if let previousVisitedNode = previousNode?.previousVisitedNode {
                        
                        previousNode = previousVisitedNode
                        path.append(previousNode!)
                    }
                    else {
                        
                        previousNode = nil
                    }
                }
                
                return path
            }
            else {
                
                for connectionNode in node.connectedNodes {
                    
                    if !connectionNode.visited {
                        
                        connectionNode.visited = true
                        connectionNode.previousVisitedNode = node
                        
                        queue.enqueue(connectionNode)
                    }
                }
            }
        }
        
        return nil
    }

    
}
