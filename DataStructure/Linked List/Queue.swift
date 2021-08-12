//
//  Queue.swift
//  DataStructure
//
//  Created by 윤태민 on 5/28/21.
//

import Foundation

public class Queue<Element>: LinkedList<Element> {
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
