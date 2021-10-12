//
//  BinaryTree.swift
//  DataStructure
//
//  Created by 윤태민 on 10/12/21.
//

import Foundation

public class BinaryTree<Element> {
    public private(set) var root: BinaryNode<Element>?
    
    public var isEmpty: Bool {
        return root == nil
    }
    
    public var count: Int {
        0
    }

    public var height: Int {
        0
    }
    
    public init() {
        
    }
    
    public init(root: BinaryNode<Element>) {
        self.root = root
    }
}

extension BinaryTree {
    public func inorder() -> [Element] {
        var arr: [Element] = []
        
        func recursiveFuction(binaryNode: BinaryNode<Element>?) {
            if let node = binaryNode {
                if let left = node.left { recursiveFuction(binaryNode: left) }
                arr.append(node.data)
                if let right = node.right { recursiveFuction(binaryNode: right) }
            }
        }
        
        recursiveFuction(binaryNode: root)
        return arr
    }
    
    public func preorder() -> [Element] {
        var arr: [Element] = []
        
        func recursiveFuction(binaryNode: BinaryNode<Element>?) {
            if let node = binaryNode {
                arr.append(node.data)
                if let left = node.left { recursiveFuction(binaryNode: left) }
                if let right = node.right { recursiveFuction(binaryNode: right) }
            }
        }
        
        recursiveFuction(binaryNode: root)
        return arr
    }
    
    public func postorder() -> [Element] {
        var arr: [Element] = []
        
        func recursiveFuction(binaryNode: BinaryNode<Element>?) {
            if let node = binaryNode {
                if let left = node.left { recursiveFuction(binaryNode: left) }
                if let right = node.right { recursiveFuction(binaryNode: right) }
                arr.append(node.data)
            }
        }
        
        recursiveFuction(binaryNode: root)
        return arr
    }
}
