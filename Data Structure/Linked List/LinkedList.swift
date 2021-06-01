//
//  LinkedList.swift
//  Chapter 05
//
//  Created by 윤태민 on 5/27/21.
//

import Foundation

class LinkedList<Element> {
    var first: Node<Element>?
    var last: Node<Element>?
    var count: Int              // 원소의 갯수 저장
    
    init() {
        self.count = 0
    }
    
    init(_ node: Node<Element>) {
        self.first = node
        self.last = node
        self.count = 1
    }
}

extension LinkedList {
    subscript(_ index: Int) -> Node<Element>? {
        get {
            guard index >= 0 && index < count else {
                print("Index out of range")
                return nil
            }
            
            var node: Node<Element>? = first
            for _ in 0 ..< index {              // index의 값만큼 다음 Node로 이동
                node = node!.getNext()!
            }

            return node
        }

        set {
            guard index >= 0 && index < count else {
                print("Index out of range")
                return
            }
            
            newValue!.setNext(self[index + 1])  // 대상 Node의 다음 Node 설정
            
            if index == 0 {                     // 첫 번째 원소를 수정하는 경우
                self.first = newValue           // 대상 Node를 first로 설정
            }
            else {                              // 이전 Node의 다음 Node를 대상 Node로 설정
                if index == count - 1 {         // 마지막 원소를 수정하는 경우
                    self.last = newValue
                }
                var node: Node<Element> = first!
                for _ in 0 ..< index - 1 {
                    node = node.getNext()!
                }
                node.setNext(newValue)
            }
        }
    }
}

extension LinkedList {
    func isEmpty() -> Bool {
        return count == 0 ? true : false
    }
    
    func append(_ node: Node<Element>) {
        if isEmpty() {
            first = node
        }
        else {
            last?.setNext(node)
        }
        last = node
        count += 1
    }
}
