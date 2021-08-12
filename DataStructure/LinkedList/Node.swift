//
//  Node.swift
//  Chapter 05
//
//  Created by 윤태민 on 5/22/21.
//

import Foundation

class Node<T> {
    var data: T
    var next: Node?         // 다음 Node를 가리키기 위한 변수
    
    init(_ data: T) {
        self.data = data
//        print("Node with \(data) has been created.")
    }
    
    init(_ data: T, next: Node?) {
        self.data = data
        self.next = next
//        print("Node with \(data) has been created.")
    }
    
    func getData() -> T {
        return data
    }
    
    deinit {
//        print("Node with \(data) has been expired.")
    }
}
