//
//  Queue.swift
//  Data Structure
//
//  Created by 윤태민 on 5/28/21.
//

import Foundation

class Queue<Element>: LinkedList<Element> {
    @discardableResult func pop() -> Node<Element>? {
        guard !isEmpty() else {
            return nil
        }
        
        let result: Node? = first
        first = first?.getNext()
        count -= 1
        
        return result
    }
}
