//
//  List.swift
//  DataStructure
//
//  Created by 윤태민 on 5/31/21.
//

import Foundation

/// This type has been descriped using LinkedList type.
public class List<Element>: LinkedList<Element> {
    /// Inserts a new node into the collection at the specified position.
    ///
    /// The following example insert a new node in the collection:
    ///
    ///     var numbers: List = List<Int>(Node(1))
    ///     numbers.append(Node(2))
    ///     numbers.insert(Node(3), at: 1)
    ///
    ///     print(numbers[1].data))
    ///     // Prints "3"
    ///
    /// - Parameters:
    ///   - newNode: The new node to insert into the collection.
    ///   - index: The position at which to insert the new node. index must be a valid index into the collection.
    ///
    /// - Complexity: O(*n*), where *n* is the length of the collection. If i is last index, this method is equivalent to append(_:)
    public func insert(_ newNode: Node<Element>, at index: Int) {
        guard index >= 0 && index <= count else {
            fatalError("Index out of rage")
        }
        
        if index == self.count {        // 리스트의 마지막에 원소 추가
            append(newNode)
        }
        else {
            if index == 0 {             // 가장 앞에 추가되므로 추가 될 노드를 가리키는 노드 없음
                newNode.next = first
                first = newNode
            }
            else {
                let tmpNode: Node = self[index - 1]
                newNode.next = tmpNode.next
                tmpNode.next = newNode
            }
            count += 1
        }
    }
}

extension List {
    /// Removes and returns the node at the specified position.
    ///
    /// The following example remove  a  node in the collection:
    ///
    ///     var numbers: List = List<Int>(Node(1))
    ///     numbers.append(Node(2))
    ///     numbers.append(Node(3))
    ///
    ///     print(numbers.remove(at: 1)!.data)
    ///     print(numbers[1]!.data)
    ///     // Prints "2" and "3"
    ///
    /// - Parameter index: The position of the element to remove. index must be a valid index of the collection that is not equal to the collection's end index.
    /// - Returns: The node at the specified index.
    ///
    /// - Complexity: O(*n*), where *n* is the length of the collection.
    public func remove(at index: Int) -> Node<Element>? {
        guard index >= 0 && index < self.count else {
            fatalError("Index out of rage")
        }
        
        let result: Node = self[index]
        if index == 0 {
            if count == 1 {         // List에 원소가 하나일 때
                first = nil
                last = nil
            }
            else {
                first = self[1]     // self[0]가 어디서도 참조되지 않으면 자동으로 메모리에서 해제 됨
            }
        }
        else {
            let tmpNode: Node = self[index - 1]
            if index == self.count - 1 {        // 마지막 원소 삭제
                tmpNode.next = nil
                last = tmpNode
            }
            else {                  // self[index]가 어디서도 참조되지 않으면 자동으로 메모리에서 해제 됨
                tmpNode.next = tmpNode.next!.next
            }
        }
        count -= 1
        
        return result
    }
}


