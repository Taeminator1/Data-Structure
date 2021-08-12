//
//  PriorityQueue.swift
//  DataStructure
//
//  Created by 윤태민 on 6/1/21.
//

import Foundation

/// The specified type of Heap. 
public class PriorityQueue<Element: Comparable>: Heap<Element> {
    /// Returns the most preferential element of the collection.
    /// And arrange to comply with arrangement of the type.
    ///
    /// This method is equivalent to remove() of the Heap.
    ///
    /// - Complexity: O(log *n*), where *n* is the length of the sequence.
    /// 
    /// - Returns: The first node of the Array.
    @discardableResult public func pop() -> HeapNode<Element>? {
        return remove()
    }
}
