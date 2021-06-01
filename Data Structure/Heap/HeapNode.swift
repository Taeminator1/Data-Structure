//
//  HeapNode.swift
//  Data Structure
//
//  Created by 윤태민 on 6/1/21.
//

import Foundation

class HeapNode<T: Comparable>: Comparable {
    var key: T          // 비교 가능한 프로토콜 추가
                        // 중복 가능
    init(_ key: T) {
        self.key = key
    }
    
    func getKey() -> T {
        return key
    }
    
    func setKey(_ key: T) {
        self.key = key
    }
    
    static func < (lhs: HeapNode<T>, rhs: HeapNode<T>) -> Bool {
        return lhs.getKey() < rhs.getKey()
    }
    
    static func == (lhs: HeapNode<T>, rhs: HeapNode<T>) -> Bool {
        return lhs.getKey() == rhs.getKey()
    }
}
