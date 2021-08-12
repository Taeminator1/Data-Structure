//
//  HeapNode.swift
//  DataStructure
//
//  Created by 윤태민 on 6/1/21.
//

import Foundation

public class HeapNode<T: Comparable>: Comparable {
    public var data: T
    
    public init(_ data: T) {
        self.data = data
//        print("Node with \(data) has been created.")
    }
    
    public static func < (lhs: HeapNode<T>, rhs: HeapNode<T>) -> Bool {
        return lhs.data < rhs.data
    }
    
    public static func == (lhs: HeapNode<T>, rhs: HeapNode<T>) -> Bool {
        return lhs.data == rhs.data
    }
    
    deinit {
//        print("Node with \(data) has been expired.")
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
