//
//  PriorityQueue.swift
//  Data Structure
//
//  Created by 윤태민 on 6/1/21.
//

import Foundation

class PriorityQueue<Element: Comparable>: Heap<Element> {
    @discardableResult func pop() -> HeapNode<Element>? {
        return remove()
    }
}
