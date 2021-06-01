//
//  List.swift
//  Data Structure
//
//  Created by 윤태민 on 5/31/21.
//

import Foundation

class List<Element>: LinkedList<Element> {
    func insert(_ node: Node<Element>, at index: Int) {
        guard index >= 0 && index <= count else {
            print("Index out of range")
            return
        }
        
        if index == self.count {        // 리스트의 마지막에 원소 추가
            append(node)
        }
        else {
            if index == 0 {             // 가장 앞에 추가되므로 추가 될 노드를 가리키는 노드 없음
                node.setNext(first)
                first = node
            }
            else {
                let tmpNode: Node = self[index - 1]!
                node.setNext(tmpNode.getNext())
                tmpNode.setNext(node)
            }
            count += 1
        }
    }
}

extension List {
    func remove(at index: Int) -> Node<Element>? {
        guard index >= 0 && index < self.count else {
            print("Index out of range")
            return nil
        }
        
        let result: Node = self[index]!
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
            let tmpNode: Node = self[index - 1]!
            if index == self.count - 1 {        // 마지막 원소 삭제
                tmpNode.setNext(nil)
                last = tmpNode
            }
            else {                  // self[index]가 어디서도 참조되지 않으면 자동으로 메모리에서 해제 됨
//                self[index - 1]!.setNext(self[index + 1])
                tmpNode.setNext(tmpNode.getNext()!.getNext())
            }
        }
        count -= 1
        
        return result
    }
}


