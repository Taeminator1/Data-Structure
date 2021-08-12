//
//  HeapNode.swift
//  DataStructure
//
//  Created by 윤태민 on 6/1/21.
//

import Foundation

/// The type is specific type for Heap.
public class HeapNode<T: Comparable>: Comparable {
    public var data: T
    
    public init(_ data: T) {
        self.data = data
    }
    
    public static func < (lhs: HeapNode<T>, rhs: HeapNode<T>) -> Bool {
        return lhs.data < rhs.data
    }
    
    public static func == (lhs: HeapNode<T>, rhs: HeapNode<T>) -> Bool {
        return lhs.data == rhs.data
    }
}
