//
//  main.swift
//  Chapter 05
//
//  Created by 윤태민 on 5/22/21.
//

import Foundation

//print("Hello, World!")

// MARK: - Linked List Test
//print("<Linked List Test>")
//var linkedList: LinkedList = LinkedList<Int>(Node(1))
//linkedList.append(Node(2))
//linkedList.append(Node(3))
//
//print(linkedList[0]!.data)                                      // 1
//print(linkedList[1]!.data)                                      // 2
//print(linkedList[2]!.data)                                      // 3
//
//linkedList[0] = Node(8)
//linkedList[1] = Node(4)                                         // Node with 4 has been created.
//                                                                // Node with 2 has been expired.
//linkedList[2] = Node(5)
//
//print(linkedList[0]!.data)                                      // 1
//print(linkedList[1]!.data)                                      // 4
//print(linkedList[2]!.data)                                      // 3
//
//print("")

// MARK: - Queue Test
//print("<Queue Test>")
//var queue: Queue = Queue<Int>(Node(1))
//queue.append(Node(2))
//queue.append(Node(3))
//
//print(queue[0]!.data)                                           // 1
//print(queue[1]!.data)                                           // 2
//print(queue[2]!.data)                                           // 3
//
//print("pop: \(queue.pop()!.data)")                              // Node with 1 has been expired.
//                                                                // pop: 1
//
//print(queue[0]!.data)                                           // 2
//print(queue[1]!.data)                                           // 3
//
//queue.append(Node(4))                                           // Node with 4 has been created.
//
//print(queue[0]!.data)                                           // 2
//print(queue[1]!.data)                                           // 3
//print(queue[2]!.data)                                           // 4

// MARK: - List Test
//print("<List Test>")
//var list: List = List<Int>()
//list.insert(Node(0), at: 0)                                     // 빈 리스트에 원소 삽입
//
//list.insert(Node(1), at: 0)                                     // list의 가장 앞에 삽입
//list.insert(Node(2), at: 2)                                     // list의 가장 끝에 삽입
//list.insert(Node(3), at: 1)                                     // list의 중간에 삽입
//
//print(list[0]!.data)                                            // 1
//print(list[1]!.data)                                            // 3
//print(list[2]!.data)                                            // 0
//print(list[3]!.data)                                            // 2
//
//var tmpNode: Node<Int>?
//tmpNode = list.remove(at: 1)                                    // list의 중간 삭제
//print(tmpNode!.data)                                            // 3
//                                                                // Node with 3 has been expired.
//tmpNode = list.remove(at: list.count - 1)                       // list의 마지막 삭제
//print(tmpNode!.data)                                            // 2
//                                                                // Node with 2 has been expired.
//tmpNode = list.remove(at: 0)                                    // list의 첫 번째 삭제
//print(tmpNode!.data)                                            // 1
//                                                                // Node with 1 has been expired.
//tmpNode = list.remove(at: 0)                                    // list의 원소가 하나일 때 삭제
//print(tmpNode!.data)                                            // 0
//
//tmpNode = nil                                                   // Node with 0 has been expired.
//
//var arr: [Int] = []
//list = List<Int>()
//
//let number: Int = 100000
//var tmpDate: Date = Date()
//DispatchQueue.global().sync {
//    tmpDate = Date()
//    for i in 0 ..< number {
//        arr.insert(i, at: arr.count)
//    }
//    print("insert 소요 시간(Array): \(String(format: "%.3f", Date().timeIntervalSince(tmpDate)))")
//
//    tmpDate = Date()
//    for i in 0 ..< number {
//        list.insert(Node(i), at: list.count)
//    }
//    print("insert 소요 시간(List) : \(String(format: "%.3f", Date().timeIntervalSince(tmpDate)))")
//}

// MARK: - Heap Test
//print("<Heap Test>")
//var maxHeap: Heap = Heap<Int>(handler: >)               // 최대 힙
//var minHeap: Heap = Heap<Int>(handler: >)               // 최소 힙
//var someHeap: Heap = Heap<Int>(handler: { abs($0.getData()) < abs($1.getData()) })      // 기타 힙
//var heap: Heap = Heap<Int>(handler: { abs($0.getData()) < abs($1.getData()) })
//heap.insert(data: -32)
//heap.insert(data: 4)
//heap.insert(data: 35)
//heap.insert(data: 24)
//heap.insert(data: -51)
//heap.insert(data: -17)
//heap.insert(data: 53)
//heap.displayElements()
//print("")
//
//heap.remove(at: 1)
//heap.displayElements()
//print("")
//
//heap.remove()
//heap.displayElements()
//print("")
//
//heap.remove()
//heap.displayElements()
//print("")
//
//heap.remove()
//heap.displayElements()
//print("")
//
//heap.remove()
//heap.displayElements()
//print("")
//
//heap.remove()
//heap.displayElements()
//print("")

// MARK: - Priority Queue Test
//print("<Priority Test>")
var priorityQueue: PriorityQueue = PriorityQueue<String>(handler: <)
priorityQueue.insert(data: "asg")
priorityQueue.insert(data: "sagde")
priorityQueue.insert(data: "ggfj")
priorityQueue.insert(data: "cxzbr")
priorityQueue.insert(data: "yer")
priorityQueue.insert(data: "1hv")
priorityQueue.insert(data: "dci")
priorityQueue.insert(data: "32d")
priorityQueue.insert(data: "[pbo")
priorityQueue.displayElements()
print("")

print("pop: \(priorityQueue.pop()!.getData())")
priorityQueue.displayElements()
print("")

print("pop: \(priorityQueue.pop()!.getData())")
priorityQueue.displayElements()
print("")

