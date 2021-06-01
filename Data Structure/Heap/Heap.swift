//
//  Heap.swift
//  Data Structure
//
//  Created by 윤태민 on 5/31/21.
//

import Foundation

class Heap<Element: Comparable> {
    var hNodes: [HeapNode<Element>] = []
    var isMaxHeap: Bool
    var count: Int = 0      // Heap의 크기
    
    init(isMaxHeap: Bool = true) {
        self.isMaxHeap = isMaxHeap
    }
}

extension Heap {
    func isLhsBigger<T: Comparable>(lhs: T, rhs: T, isSameOK: Bool) -> Bool {
        if isSameOK && lhs == rhs  { return true }
        
        if isMaxHeap    { return lhs > rhs }
        else            { return rhs > lhs }
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
    
    func getLeft(at index: Int) -> HeapNode<Element>? {
        guard index >= 0 && index * 2 + 1 < count else {
            print("Index out of range")
            return nil
        }
        return hNodes[index * 2 + 1]
    }
    
    func getRight(at index: Int) -> HeapNode<Element>? {
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
            print($0.getKey())
        }
    }
}

extension Heap {
    func insert(key: Element) {
        var index = count
        hNodes.append(HeapNode(key))
        count += 1              // 위치 중요
        
//        while index > 0 && key > getParent(at: index)!.getKey() {
//        while index > 0 && key < getParent(at: index)!.getKey() {
        while index > 0 && isLhsBigger(lhs: key, rhs: getParent(at: index)!.getKey(), isSameOK: false) {
            
            hNodes[index].setKey(hNodes[(index - 1) / 2].getKey())
//            hNodes[index] = hNodes[(index - 1) / 2]         // 클래스이기 때문에 참조하는 식으로 하면 안 됨
            index = (index - 1) / 2
        }
        hNodes[index].setKey(key)
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
//            if cIndex < count - 1 && getLeft(at: pIndex)! < getRight(at: pIndex)! {
//            if cIndex < count - 1 && getLeft(at: pIndex)! > getRight(at: pIndex)! {
            if cIndex < count - 1 && isLhsBigger(lhs: getRight(at: pIndex)!, rhs: getLeft(at: pIndex)!, isSameOK: false) {
                cIndex += 1
            }
//            if lastHeapNode >= hNodes[cIndex] { break }
//            if lastHeapNode <= hNodes[cIndex] { break }
            if isLhsBigger(lhs: lastHeapNode, rhs: hNodes[cIndex], isSameOK: true) { break }
            
            hNodes[pIndex] = hNodes[cIndex]
            pIndex = cIndex
            cIndex = cIndex * 2 + 1
        }
        hNodes[pIndex] = lastHeapNode
        return result
    }
}
