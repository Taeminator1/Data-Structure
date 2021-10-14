//
//  test.swift
//  test
//
//  Created by 윤태민 on 9/2/21.
//

import Foundation
import DataStructure

// MARK: - Linked List Test
func linkedListTest() {
    print("<Linked List Test>")
    let linkedList: LinkedList = LinkedList<Int>(Node(1))
    linkedList.append(Node(2))
    linkedList.append(Node(3))

    print(linkedList[0].data)                                       // 1
    print(linkedList[1].data)                                       // 2
    print(linkedList[2].data)                                       // 3

    linkedList[0] = Node(8)                                         // Node with 1 has been expired.
    linkedList[1] = Node(4)                                         // Node with 2 has been created.
    linkedList[2] = Node(5)                                         // Node with 5 has been expired.

    print(linkedList[0].data)                                       // 8
    print(linkedList[1].data)                                       // 4
    print(linkedList[2].data)                                       // 5

    print(linkedList[0].next?.data ?? "")                      // 4    // Optional(4)
    print(linkedList[1].next?.data ?? "")                      // 5    // Optional(5)
    print(linkedList[2].next?.data ?? "")                      //      // nil
    
    print(linkedList.count)                                         // 3
}

// MARK: - Queue Test
func queueTest() {
    print("<Queue Test>")
    let queue: Queue = Queue<Int>(Node(1))
    queue.append(Node(2))
    queue.append(Node(3))

    print(queue[0].data)                                            // 1
    print(queue[1].data)                                            // 2
    print(queue[2].data)                                            // 3

    print("pop: \(queue.pop()!.data)")                              // Node with 1 has been expired.
                                                                    // pop: 1

    print(queue[0].data)                                            // 2
    print(queue[1].data)                                            // 3

    queue.append(Node(4))                                           // Node with 4 has been created.

    print(queue[0].data)                                            // 2
    print(queue[1].data)                                            // 3
    print(queue[2].data)                                            // 4

    print(queue.pop()?.data ?? "")                                  // 2    // Optional(2)
    print(queue.pop()?.data ?? "")                                  // 3    // Optional(3)
    print(queue.pop()?.data ?? "")                                  // 4    // Optional(4)
    print(queue.pop()?.data ?? "")                                  //      // nil
    
    print(queue.count)                                              // 0
}

// MARK: - List Test
func listTest() {
    print("<List Test>")
    let list: List = List<Int>()
    list.insert(Node(0), at: 0)                                     // 빈 리스트에 원소 삽입
    
    list.insert(Node(1), at: 0)                                     // list의 가장 앞에 삽입
    list.insert(Node(2), at: 2)                                     // list의 가장 끝에 삽입
    list.insert(Node(3), at: 1)                                     // list의 중간에 삽입
    
    print(list.count)                                               // 4
    
    print(list[0].data)                                             // 1
    print(list[1].data)                                             // 3
    print(list[2].data)                                             // 0
    print(list[3].data)                                             // 2
    
    var tmpNode: Node<Int>?
    tmpNode = list.remove(at: 1)                                    // list의 중간 삭제
    print(tmpNode!.data)                                            // 3
                                                                    // Node with 3 has been expired.
    tmpNode = list.remove(at: list.count - 1)                       // list의 마지막 삭제
    print(tmpNode!.data)                                            // 2
                                                                    // Node with 2 has been expired.
    tmpNode = list.remove(at: 0)                                    // list의 첫 번째 삭제
    print(tmpNode!.data)                                            // 1
                                                                    // Node with 1 has been expired.
    tmpNode = list.remove(at: 0)                                    // list의 원소가 하나일 때 삭제
    print(tmpNode!.data)                                            // 0
    
    tmpNode = nil                                                   // Node with 0 has been expired.
    
//    var arr: [Int] = []
//    list = List<Int>()
//
//    let number: Int = 100000
//    var tmpDate: Date = Date()
//    DispatchQueue.global().sync {
//        tmpDate = Date()
//        for i in 0 ..< 10 {
//            arr.insert(i, at: arr.count)
//        }
//        print("insert 소요 시간(Array): \(String(format: "%.3f", Date().timeIntervalSince(tmpDate)))")
//
//        tmpDate = Date()
//        for i in 0 ..< 10 {
//            list.insert(Node(i), at: list.count)
//        }
//        print("insert 소요 시간(List) : \(String(format: "%.3f", Date().timeIntervalSince(tmpDate)))")
//    }
//
//    DispatchQueue.global().sync {
//        tmpDate = Date()
//        for i in 0 ..< number {
//            arr.insert(i, at: 10)
//        }
//        print("insert 소요 시간(Array): \(String(format: "%.3f", Date().timeIntervalSince(tmpDate)))")
//
//        tmpDate = Date()
//        for i in 0 ..< number {
//            list.insert(Node(i), at: 10)
//        }
//        print("insert 소요 시간(List) : \(String(format: "%.3f", Date().timeIntervalSince(tmpDate)))")
//    }
}






// MARK: - Heap Test
func heapTest() {
    print("<Heap Test>")
//    var maxHeap: Heap = Heap<Int>(handler: >)               // 최대 힙
//    var minHeap: Heap = Heap<Int>(handler: <)               // 최소 힙
//    var someHeap: Heap = Heap<Int>(handler: { abs($0.data) < abs($1.data) })      // 기타 힙
    let heap: Heap = Heap<Int>(handler: { abs($0.data) < abs($1.data) })
    heap.insert(data: -32)
    heap.insert(data: 4)
    heap.insert(data: 35)
    heap.insert(data: 24)
    heap.insert(data: -51)
    heap.insert(data: -17)
    heap.insert(data: 53)
    
    print(heap.count)                       // 7
    
    heap.displayElements()                  // 4 24 -17 -32 -51 35 53
    print("")
    
    heap.remove(at: 1)
    heap.displayElements()                  // 4 -32 -17 53 -51 35
    print("")
    
    heap.remove()
    heap.displayElements()                  // -17 -32 35 53 -51
    print("")
    
    heap.remove()
    heap.displayElements()                  // -32 -51 35 53
    print("")
    
    heap.remove()
    heap.displayElements()                  // 35 -51 53
    print("")
    
    heap.remove()
    heap.displayElements()                  // -51 53
    print("")
    
    print(heap.remove()?.data ?? "")        // 51   // Optional(-51)
    heap.displayElements()                  // 53
    print(heap.count)                       // 1
    print("")
    
    
    print(heap.remove()?.data ?? "")        // 53   // Optional(53)
    heap.displayElements()                  //
    print(heap.count)                       // 0
    print("")
    
    print(heap.remove()?.data ?? "")        //      // nil
}



// MARK: - Priority Queue Test
func priorityQueueTest() {
    print("<Priority Test>")
    let priorityQueue: PriorityQueue = PriorityQueue<String>(handler: <)
    priorityQueue.insert(data: "asg")
    priorityQueue.insert(data: "sagde")
    priorityQueue.insert(data: "ggfj")
    priorityQueue.insert(data: "cxzbr")
    priorityQueue.insert(data: "yer")
    priorityQueue.insert(data: "1hv")
    priorityQueue.insert(data: "dci")
    priorityQueue.insert(data: "32d")
    priorityQueue.insert(data: "[pbo")
    priorityQueue.displayElements()                 // 1hv 32d asg [pbo yer ggfj dci sagde cxzbr
    print("")

    print("pop: \(priorityQueue.pop()!.data)")      // pop: 1hv
    priorityQueue.displayElements()                 // 32d [pbo asg cxzbr yer ggfj dci sagde
    print("")

    print("pop: \(priorityQueue.pop()!.data)")      // pop: 32d
    priorityQueue.displayElements()                 // [pbo cxzbr asg sagde yer ggfj dci
    print("")
}


// MARK:- Binary Tree
func binaryTree() {
    print("<Binary Tree Test>")
    let binaryNodeD: BinaryNode = BinaryNode<String>("D")
    let binaryNodeE: BinaryNode = BinaryNode<String>("E")
    let binaryNodeB: BinaryNode = BinaryNode<String>("B", left: binaryNodeD, right: binaryNodeE)
    let binaryNodeF: BinaryNode = BinaryNode<String>("F")
    let binaryNodeC: BinaryNode = BinaryNode<String>("C", left: binaryNodeF)
    let binaryNodeA: BinaryNode = BinaryNode<String>("A", left: binaryNodeB, right: binaryNodeC)
    
    let binaryTree: BinaryTree = BinaryTree<String>(root: binaryNodeA)
    print(binaryTree.inorder())
    print(binaryTree.preorder())
    print(binaryTree.postorder())
    
    print(binaryTree.count)
    print(binaryTree.height)
}
