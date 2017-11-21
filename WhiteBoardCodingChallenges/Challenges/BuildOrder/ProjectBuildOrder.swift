//
//  BuildOrder.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 02/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//CtCI 4.7
class ProjectBuildOrder: NSObject {

    class func buildOrder(_ projects: [String], dependencies: [[String]]) -> [ProjectBuildOrderNode]? {
        
        let nodes = buildNodes(projects, dependencies: dependencies)
        
        for node in nodes {
            
            for dependency in node.dependencies {
                
                if dependencyCycleExistsBetweenNodes(dependency, destination: node) {
                    
                    return nil
                }
            }
        }
        
        var orderedNodes = [ProjectBuildOrderNode]()
    
        for node in nodes {
            
            if !node.pathVisited {
            
                buildOrder(node, vistedNodes: &orderedNodes)
            }
        }
        
        return orderedNodes
    }
    
    fileprivate class func buildOrder(_ rootNode: ProjectBuildOrderNode, vistedNodes: inout [ProjectBuildOrderNode]) {
        
        for dependency in rootNode.dependencies {
            
            if !dependency.pathVisited {
                
                buildOrder(dependency, vistedNodes: &vistedNodes)
            }
        }
        
        vistedNodes.append(rootNode)
        rootNode.pathVisited = true
    }
    
    fileprivate class func buildNodes(_ projects: [String], dependencies: [[String]]) -> [ProjectBuildOrderNode] {
        
        var nodes = [String: ProjectBuildOrderNode]()
        
        for project in projects {
            
            let node = ProjectBuildOrderNode.init(value: project)
            
            nodes[project] = node
        }
        
        for dependencyPair in dependencies {
            
            let dependent = dependencyPair[1]
            let dependency = dependencyPair[0]
            
            let dependentNode = nodes[dependent]
            let dependencyNode = nodes[dependency]
            
            dependentNode?.addDependency(dependencyNode!)
        }
        
        return Array(nodes.values)
    }
    
    fileprivate class func dependencyCycleExistsBetweenNodes(_ source: ProjectBuildOrderNode, destination: ProjectBuildOrderNode) -> Bool {
        
        var queue = [ProjectBuildOrderNode]()
        queue.append(source)
        
        while queue.count > 0 {
            
            let node = queue.removeFirst()
            
            for dependency in node.dependencies {
                
                if dependency == destination {
                    
                    return true
                }
                
                if !dependency.visited {
                    
                    dependency.visited = true
                    
                    queue.append(dependency)
                }
            }
        }
        
        return false
    }
}
