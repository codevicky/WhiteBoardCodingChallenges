//
//  HeapSort.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 27/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class HeapSort: NSObject {

    // MARK: Max
    
    class func maxHeapSort(_ input: [Int]) -> [Int] {
        
        if input.count < 2 {
            
            return input
        }
        
        var maxHeap = MaxHeap.buildMaxHeap(input)
        var heapSorted = [Int]()
        
        while maxHeap.count > 1 {
            
            heapSorted.insert(maxHeap[0], at: 0)
            exchange(&maxHeap, i: 0, j: (maxHeap.count - 1))
            maxHeap.removeLast()
            MaxHeap.maxHeapify(&maxHeap, indexRoot: 0)
        }
        
        heapSorted.insert(maxHeap[0], at: 0)
        
        return heapSorted
    }
    
    // MARK: Min
    
    class func minHeapSort(_ input: [Int]) -> [Int] {
        
        if input.count < 2 {
            
            return input
        }
        
        var minHeap = MinHeap.buildMinHeap(input)
        var heapSorted = [Int]()
        
        while minHeap.count > 1 {
            
            heapSorted.insert(minHeap[0], at: 0)
            exchange(&minHeap, i: 0, j: (minHeap.count - 1))
            minHeap.removeLast()
            MinHeap.minHeapify(&minHeap, indexRoot: 0)
        }
        
        heapSorted.insert(minHeap[0], at: 0)
        
        return heapSorted
    }
    
    // MARK: Exchange
    
    class func exchange<T>(_ heap: inout [T], i:Int, j:Int) {
        
        let temp:T = heap[i]
        heap[i] = heap[j]
        heap[j] = temp
    }
}
