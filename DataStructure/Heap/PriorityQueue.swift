//
//  PriorityQueue.swift
//  DataStructure
//
//  Created by 윤태민 on 6/1/21.
//

import Foundation

public class PriorityQueue<Element: Comparable>: Heap<Element> {
    @discardableResult public func pop() -> HeapNode<Element>? {
        return remove()
    }
}
