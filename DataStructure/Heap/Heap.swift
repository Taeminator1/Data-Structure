//
//  Heap.swift
//  DataStructure
//
//  Created by 윤태민 on 5/31/21.
//

import Foundation

/// The Heap is made by using Array.
public class Heap<Element: Comparable> {
    public typealias HandlerType = (HeapNode<Element>, HeapNode<Element>) -> Bool
    var hNodes: [HeapNode<Element>] = []
    var tmpCount: Int = 0               // count를 임의로 수정하지 못하게 임시 저장하는 변수
    let handler: HandlerType
    
    /// The number of elements in the collection.
    public var count: Int {
        return tmpCount
    }
    
    /// A Boolean value indicating whether the collection is empty.
    public var isEmpty: Bool {
        return tmpCount == 0
    }
    
    /// Sets a type of heap, as in the lollowing example:
    ///
    ///     var minHeap: Heap = Heap<Int>(handler: >)       // min heap
    ///     var maxHeap: Heap = Heap<Int>(handler: >)       // max heap
    /// - Parameter handler: you can transfer function that decide condition for comparing two hNodes.
    public init(handler: @escaping HandlerType = { $0 > $1 }) {
        self.handler = handler
    }
}

extension Heap {
    /// - Parameter index: The position of the target node.
    /// - Returns: The parent node of the collection.
    func getParent(at index: Int) -> HeapNode<Element> {
        guard index > 0 && index < count else {
            fatalError("Index out of range")
        }
        return hNodes[(index - 1) / 2]
    }
    
    /// - Parameter index: The position of the target node.
    /// - Returns: The left child node of the collection.
    func getLeftChild(at index: Int) -> HeapNode<Element> {
        guard index >= 0 && index * 2 + 1 < count else {
            fatalError("Index out of range")
        }
        return hNodes[index * 2 + 1]
    }
    
    /// - Parameter index: The position of the target node.
    /// - Returns: The right child node of the collection.
    func getRightChild(at index: Int) -> HeapNode<Element> {
        guard index >= 0 && index * 2 + 2 < count else {
            fatalError("Index out of range")
        }
        return hNodes[index * 2 + 2]
    }
}

extension Heap {
    /// Displays every element of the collection.
    ///
    ///     var h: Heap = Heap<Int>(handler: >)
    ///     h.insert(data: 2)
    ///     h.insert(data: 1)
    ///     h.insert(data: 3)
    ///     h.insert(data: 4)
    ///
    ///     h.displayElements()
    ///     // prints "4 3 2 1 "
    public func displayElements() {
        hNodes.forEach {
            print($0.data, terminator: " ")
        }
        print("")
    }
}

extension Heap {
    /// Inserts elemet into the collection to comply with arrangement of the type.
    ///
    /// The following example insert data in the collection.
    ///
    ///     var h: Heap = Heap<Int>(handler: >)
    ///     h.insert(data: 2)
    ///     h.insert(data: 1)
    ///     h.insert(data: 3)
    ///     h.insert(data: 4)
    ///
    /// - Parameter data: The new data to insert into the collection.
    ///
    /// - Complexity: O(log *n*), where *n* is the number of the elements.
    public func insert(data: Element) {
        var index = count
        hNodes.append(HeapNode(data))           // hNodes의 자리만 늘리기 위한 목적
        tmpCount += 1
        
        while index > 0 && handler(HeapNode(data), getParent(at: index)){
            hNodes[index].data = hNodes[(index - 1) / 2].data
            index = (index - 1) / 2
        }
        hNodes[index].data = data
    }
    
    /// Rmoves elemet of the collection. And arrange to comply with arrangement of the type.
    ///
    /// The following example insert data in the collection.
    ///
    ///     var h: Heap = Heap<Int>(handler: >)
    ///     h.insert(data: 2)
    ///     h.insert(data: 1)
    ///     h.insert(data: 3)
    ///     h.insert(data: 4)
    ///
    ///     print(h.remove(at: 2)!.data)
    ///     // Prints "2"
    ///
    /// - Parameter index: The position of the element to remove. index must be a valid index of the collection that is not equal to the collection's end index.
    /// - Returns: The node at the specified index.
    ///
    /// - Complexity: O(log *n*), where *n* is the number of the elements.
    @discardableResult public func remove(at index: Int = 0) -> HeapNode<Element>? {
        guard index >= 0 && index < count else {
            return nil
        }
        
        let result: HeapNode<Element> = hNodes[index]
        tmpCount -= 1              // 위치 중요
        if count == 0 { return result }         // 없이 만들 수 있을까??
        
        let lastHeapNode: HeapNode<Element> = hNodes.removeLast()
        var pIndex: Int = index             // parent index
        var cIndex: Int = pIndex * 2 + 1    // child index
        while cIndex < count {
            if cIndex < count - 1 && handler(getRightChild(at: pIndex), getLeftChild(at: pIndex)) {
                cIndex += 1
            }
            
            if lastHeapNode == hNodes[cIndex] || handler(lastHeapNode, hNodes[cIndex]) { break }
            
            hNodes[pIndex] = hNodes[cIndex]
            pIndex = cIndex
            cIndex = cIndex * 2 + 1
        }
        hNodes[pIndex] = lastHeapNode
        return result
    }
}
