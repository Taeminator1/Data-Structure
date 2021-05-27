//
//  main.swift
//  Chapter 05
//
//  Created by 윤태민 on 5/22/21.
//

import Foundation

print("Hello, World!")

var linkedList: LinkedList = LinkedList<Int>(Node(1))           // Node with 1 has been created.
linkedList.append(Node(2))                                      // Node with 2 has been created.
linkedList.append(Node(3))                                      // Node with 3 has been created.

print(linkedList[0]!.data)                                      // 1
print(linkedList[1]!.data)                                      // 2
print(linkedList[2]!.data)                                      // 3

linkedList[1] = Node(4)                                         // Node with 4 has been created.
                                                                // Node with 2 has been created.

print(linkedList[0]!.data)                                      // 1
print(linkedList[1]!.data)                                      // 4
print(linkedList[2]!.data)                                      // 3

//linkedList.first?.setNext(node)
