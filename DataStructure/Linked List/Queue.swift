//
//  Queue.swift
//  DataStructure
//
//  Created by 윤태민 on 5/28/21.
//

import Foundation


/// This type has been descriped using LinkedList type.
public class Queue<Element>: LinkedList<Element> {
    /// Removes and returns the end node of the collection.
    /// The end node will be dismissed.
    ///
    ///     var q: Queue = Queue<Int>(Node(1))
    ///     q.append(Node(2))
    ///     q.append(Node(3))
    ///
    ///     print("q.pop()!.data")
    ///     // Prints "1"
    ///
    /// - Returns: The end node.
    /// 
    /// - Complexity: O(1)
    @discardableResult public func pop() -> Node<Element>? {
        guard !isEmpty else {
            return nil
        }
        
        let result: Node? = first
        first = first?.next
        count -= 1
        
        return result
    }
}
