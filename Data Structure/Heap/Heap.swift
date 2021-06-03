//
//  Heap.swift
//  Data Structure
//
//  Created by 윤태민 on 5/31/21.
//

import Foundation

class Heap<Element: Comparable> {
    var hNodes: [HeapNode<Element>] = []
    var count: Int = 0      // hNodes의 원소의 개수
    let handler: ((HeapNode<Element>, HeapNode<Element>) -> Bool)
    
    init(handler: @escaping ((HeapNode<Element>, HeapNode<Element>) -> Bool) = { $0 > $1 }) {
        self.handler = handler
    }
}

extension Heap {
    func getParent(at index: Int) -> HeapNode<Element>? {
        guard index > 0 && index < count else {
            print("Index out of range")
            return nil
        }
        return hNodes[(index - 1) / 2]
    }
    
    func getLeftChild(at index: Int) -> HeapNode<Element>? {
        guard index >= 0 && index * 2 + 1 < count else {
            print("Index out of range")
            return nil
        }
        return hNodes[index * 2 + 1]
    }
    
    func getRightChild(at index: Int) -> HeapNode<Element>? {
        guard index >= 0 && index * 2 + 2 < count else {
            print("Index out of range")
            return nil
        }
        return hNodes[index * 2 + 2]
    }
}

extension Heap {
    func isEmpty() -> Bool {
        return count == 0 ? true : false
    }
    
    func displayElements() {
        hNodes.forEach {
            print($0.getData())
        }
    }
}

extension Heap {
    func insert(data: Element) {
        var index = count
        hNodes.append(HeapNode(data))           // hNodes의 자리만 늘리기 위한 목적
        count += 1
        
        while index > 0 && handler(HeapNode(data), getParent(at: index)!){
            hNodes[index].setData(hNodes[(index - 1) / 2].getData())
//            hNodes[index] = hNodes[(index - 1) / 2]         // HeapNode가 클래스이기 때문에 참조하는 식으로 하면 안 됨,
//                                                            // HeapNode가 구조체이면 가능
            index = (index - 1) / 2
        }
        hNodes[index].setData(data)
    }
    
    @discardableResult func remove(at index: Int = 0) -> HeapNode<Element>? {
        guard index >= 0 && index < count else {
            return nil
        }
        
        let result: HeapNode<Element> = hNodes[index]
        count -= 1              // 위치 중요
        if count == 0 { return result }         // 없이 만들 수 있을까??
        
        let lastHeapNode: HeapNode<Element> = hNodes.removeLast()
        var pIndex: Int = index             // parent index
        var cIndex: Int = pIndex * 2 + 1    // child index
        while cIndex < count {
            if cIndex < count - 1 && handler(getRightChild(at: pIndex)!, getLeftChild(at: pIndex)!) {
                cIndex += 1
            }
            
            if lastHeapNode == hNodes[cIndex] && handler(lastHeapNode, hNodes[cIndex]) { break }
            
            hNodes[pIndex] = hNodes[cIndex]
            pIndex = cIndex
            cIndex = cIndex * 2 + 1
        }
        hNodes[pIndex] = lastHeapNode
        return result
    }
}

extension Heap {
    func ex() {
        print(handler(hNodes[0], hNodes[1]))
    }
}
