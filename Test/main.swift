//
//  main.swift
//  Test
//
//  Created by 윤태민 on 8/12/21.
//

//  Command Line Tool for test of DataStructure framework

import Foundation

//linkedListTest()
//queueTest()
//listTest()
//heapTest()
//priorityQueueTest()

//binaryTree()


import DataStructure

let n1 = BinaryNode<Int>(1)
let n2 = BinaryNode<Int>(3)
let n3 = BinaryNode<Int>(2, left: n1, right: n2)
let t = BinaryTree<Int>(root: n3)
print(t.inorder())
print(t.preorder())
print(t.postorder())
