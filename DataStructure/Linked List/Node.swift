//
//  Node.swift
//  DataStructure
//
//  Created by 윤태민 on 5/22/21.
//

import Foundation

/// A type tha is able to represent an element that consist of Linked List, Queue or List.
///
/// You can use this type with any type and set another instance to approch that one, as in the following example:
///
///     let n1 = Node<Int>(1)
///     let n2 = Node<Int>(3, node: n1)
///     
///     print(n2.next!.data)
///     // Prints "1"
public class Node<T> {
    public var data: T
    public var next: Node?         // 다음 Node를 가리키기 위한 변수
    
    /// Sets a data you want to store for the instance.
    /// - Parameter data: Any kind of data.
    public init(_ data: T) {
        self.data = data
    }
    
    /// Sets the data want to store and the node to indicate fron the instance.
    /// - Parameters:
    ///   - data: Any kind of data.
    ///   - next: A node to indicate.
    public init(_ data: T, next: Node<T>?) {
        self.data = data
        self.next = next
    }
    
    /// - Returns: Returns data.
    public func getData() -> T {
        return data
    }
}
