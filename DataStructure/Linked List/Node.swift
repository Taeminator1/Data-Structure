//
//  Node.swift
//  DataStructure
//
//  Created by 윤태민 on 5/22/21.
//

import Foundation

public class Node<T> {
    public var data: T
    public var next: Node?         // 다음 Node를 가리키기 위한 변수
    
    public init(_ data: T) {
        self.data = data
//        print("Node with \(data) has been created.")
    }
    
    public init(_ data: T, next: Node?) {
        self.data = data
        self.next = next
//        print("Node with \(data) has been created.")
    }
    
    public func getData() -> T {
        return data
    }
    
    deinit {
//        print("Node with \(data) has been expired.")
    }
}
