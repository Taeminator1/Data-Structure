//
//  HeapNode.swift
//  Data Structure
//
//  Created by 윤태민 on 6/1/21.
//

import Foundation

class HeapNode<T: Comparable>: Comparable {
    var data: T
    
    init(_ data: T) {
        self.data = data
    }
    
    func getData() -> T {
        return data
    }
    
    func setData(_ data: T) {
        self.data = data
    }
    
    static func < (lhs: HeapNode<T>, rhs: HeapNode<T>) -> Bool {
        return lhs.getData() < rhs.getData()
    }
    
    static func == (lhs: HeapNode<T>, rhs: HeapNode<T>) -> Bool {
        return lhs.getData() == rhs.getData()
    }
    
    deinit {
        print("Node with \(data) has been expired.")
    }
}


//struct HeapNode<T: Comparable>: Comparable {
//    var data: T
//    
//    init(_ data: T) {
//        self.data = data
//    }
//    
//    func getData() -> T {
//        return data
//    }
//    
//    mutating func setData(_ data: T) {
//        self.data = data
//    }
//    
//    static func < (lhs: HeapNode<T>, rhs: HeapNode<T>) -> Bool {
//        return lhs.getData() < rhs.getData()
//    }
//    
//    static func == (lhs: HeapNode<T>, rhs: HeapNode<T>) -> Bool {
//        return lhs.getData() == rhs.getData()
//    }
//}
