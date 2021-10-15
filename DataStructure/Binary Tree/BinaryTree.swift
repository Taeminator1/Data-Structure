//
//  BinaryTree.swift
//  DataStructure
//
//  Created by 윤태민 on 10/12/21.
//

import Foundation


/// this type consist of node that is root.
public class BinaryTree<Element> {
    public private(set) var root: BinaryNode<Element>?
    
    /// A Boolean value indicating whether the collection is empty.
    public var isEmpty: Bool {
        return root == nil
    }
    
    
    /// The number of elements in the tree including root.
    ///
    /// - Complexity: O(*n*), where *n* is the number of the elements.
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

    /// The number of elements in the tree from root.
    ///
    /// - Complexity: O(*n*), where *n* is the number of the elements.
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
        self.root = nil
    }
    
    public init(root: BinaryNode<Element>) {
        self.root = root
    }
}

extension BinaryTree {
    
    
    
    /// Assemble the element of the tree by rouding.
    /// Rounding in order like root of left subtree, root and root of right subtree.
    ///
    ///     let n1 = BinaryNode<Int>(1)
    ///     let n2 = BinaryNode<Int>(3)
    ///     let n3 = BinaryNode<Int>(2, left: n1, right: n2)
    ///
    ///     let t = BinaryTree<Int>(root: n3)
    ///
    ///     print(t.inorder())
    ///     // Prints "[1, 2, 3]"
    ///
    /// - Returns: The array for the tree by inorder.
    ///
    /// - Complexity: O(*n*), where *n* is the number of the elements.
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
    
    /// Assemble the element of the tree by rouding.
    /// Rounding in order like root, root of left subtree and root of right subtree.
    ///
    ///     let n1 = BinaryNode<Int>(1)
    ///     let n2 = BinaryNode<Int>(3)
    ///     let n3 = BinaryNode<Int>(2, left: n1, right: n2)
    ///
    ///     let t = BinaryTree<Int>(root: n3)
    ///
    ///     print(t.inorder())
    ///     // Prints "[2, 1, 3]"
    ///
    /// - Returns: The array for the tree by preorder.
    ///
    /// - Complexity: O(*n*), where *n* is the number of the elements.
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
    
    /// Assemble the element of the tree by rouding.
    /// Rounding in order like root of left subtree, root of right subtree and root.
    ///
    ///     let n1 = BinaryNode<Int>(1)
    ///     let n2 = BinaryNode<Int>(3)
    ///     let n3 = BinaryNode<Int>(2, left: n1, right: n2)
    ///
    ///     let t = BinaryTree<Int>(root: n3)
    ///
    ///     print(t.inorder())
    ///     // Prints "[1, 3, 2]"
    ///
    /// - Returns: The array for the tree by postorder.
    ///
    /// - Complexity: O(*n*), where *n* is the number of the elements.
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
