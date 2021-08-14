//
//  LinkedList.swift
//  DataStructure
//
//  Created by 윤태민 on 5/27/21.
//

import Foundation

/// This type consist of nodes to indicate their locaitons and the number of elements of the LinkedList.
public class LinkedList<Element> {
    var first: Node<Element>?
    var last: Node<Element>?
    public internal(set) var count: Int = 0          // The number of elements in the collection.
    
    /// A Boolean value indicating whether the collection is empty.
    public var isEmpty: Bool {
        return count == 0
    }
    
    /// Create a new instace with making the number of elements 0.
    public init() {
        self.count = 0
    }
    
    /// Create a new instance from the given node.
    /// - Parameter node: The first element of the collection.
    public init(_ node: Node<Element>) {
        self.first = node
        self.last = node
        self.count = 1
    }
}

extension LinkedList {
    
    /// You can access or set the other elements using subscript like Array.
    ///
    /// As in the following example:
    ///
    ///     var numbers = LinkedList<Int>(Node(4))
    ///
    ///     print(numbers[0].data)
    ///     // prints "4"
    public subscript(_ index: Int) -> Node<Element> {
        get {
            guard index >= 0 && index < count else {
                fatalError("Index out of range")
            }
            
            var node: Node<Element> = first!
            for _ in 0 ..< index {              // index의 값만큼 다음 Node로 이동
                node = node.next!
            }

            return node
        }

        set {
            guard index >= 0 && index < count else {
                fatalError("Index out of range")
            }
            
            if index != count - 1 {             // index가 마지막 원소가 아닐 때,
                newValue.next = self[index + 1]
            }
            
            if index == 0 {                     // 첫 번째 원소를 수정하는 경우
                self.first = newValue           // 대상 Node를 first로 설정
            }
            else {                              // 이전 Node의 다음 Node를 대상 Node로 설정
                if index == count - 1 {         // 마지막 원소를 수정하는 경우
                    self.last = newValue
                }
                var node: Node<Element> = first!
                for _ in 0 ..< index - 1 {
                    node = node.next!
                }
                node.next = newValue
            }
        }
    }
}

extension LinkedList {
    /// Adds a new node to the end of the collection.
    ///
    /// It doesn't need additional storage for a node. It just change the properties of the type.
    /// The following example adds a new node to a collection:
    ///
    ///     var numbers = LinkedList<Int>()
    ///     numbers.append(Node(0))
    ///     numbers.append(Node(1))
    ///     numbers.append(Node(2))
    ///
    ///     print(numbers2[2].data)
    ///     // prints "2"
    ///
    /// - Parameter newNode: The new node to append to the collection.
    /// 
    /// - Complexity: O(1)
    public func append(_ newNode: Node<Element>) {
        if isEmpty {
            first = newNode
        }
        else {
            last?.next = newNode
        }
        last = newNode
        count += 1
    }
}

