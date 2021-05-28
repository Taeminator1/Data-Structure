//
//  main.swift
//  Chapter 05
//
//  Created by 윤태민 on 5/22/21.
//

import Foundation

print("Hello, World!")


// MARK: - Linked List Test
print("<Linked List Test>")
var linkedList: LinkedList = LinkedList<Int>(Node(1))
linkedList.append(Node(2))
linkedList.append(Node(3))

print(linkedList[0]!.data)                                      // 1
print(linkedList[1]!.data)                                      // 2
print(linkedList[2]!.data)                                      // 3

linkedList[1] = Node(4)                                         // Node with 4 has been created.
                                                                // Node with 2 has been expired.

print(linkedList[0]!.data)                                      // 1
print(linkedList[1]!.data)                                      // 4
print(linkedList[2]!.data)                                      // 3

print("")

// MARK: - Queue Test
print("<Queue Test>")
var queue: Queue = Queue<Int>(Node(1))
queue.append(Node(2))
queue.append(Node(3))

print(queue[0]!.data)                                           // 1
print(queue[1]!.data)                                           // 2
print(queue[2]!.data)                                           // 3

print("pop: \(queue.pop()!.data)")                              // Node with 1 has been expired.
                                                                // pop: 1

print(queue[0]!.data)                                           // 2
print(queue[1]!.data)                                           // 3

queue.append(Node(4))

print(queue[0]!.data)                                           // 2
print(queue[1]!.data)                                           // 3
print(queue[2]!.data)                                           // 4
