//
//  BinaryNode.swift
//  DataStructure
//
//  Created by 윤태민 on 10/12/21.
//

import Foundation

public class BinaryNode<T> {
    public private(set) var data: T
    public var left: BinaryNode?
    public var right: BinaryNode?
    
    public var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    public init(_ data: T, left: BinaryNode<T>? = nil, right: BinaryNode<T>? = nil) {
        self.data = data
        self.left = left
        self.right = right
    }
}
