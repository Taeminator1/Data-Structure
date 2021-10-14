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
        func recursiveFunction(binaryNode: BinaryNode<Element>?) -> Int {
            if let node = binaryNode {
                return 1 + recursiveFunction(binaryNode: node.left) + recursiveFunction(binaryNode: node.right)
            }
            else {
                return 0
            }
        }
        
        return recursiveFunction(binaryNode: root)
    }

    public var height: Int {
        func recursiveFunction(binaryNode: BinaryNode<Element>?) -> Int {
            
            if let node = binaryNode {
                let leftHeight: Int = recursiveFunction(binaryNode: node.left)
                let rightHeight: Int = recursiveFunction(binaryNode: node.right)
                return max(leftHeight, rightHeight) + 1
            }
            else {
                return 0
            }
        }
        return isEmpty ? 0 : recursiveFunction(binaryNode: root)
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
