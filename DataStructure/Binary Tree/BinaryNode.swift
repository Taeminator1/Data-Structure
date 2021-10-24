//
//  BinaryNode.swift
//  DataStructure
//
//  Created by 윤태민 on 10/12/21.
//

import Foundation


/// A type is able to represent an element that consis of Binary Tree.
///
/// You can use this type with any type and set another instance to aproch that one, as in the following example:
///
///     let n1 = BinaryNode<Int>(1)
///     let n2 = BinaryNode<Int>(3)
///     let n3 = BinaryNode<Int>(2, left: n1, right: n2)
///
///     print(n3.right!.data)
///     // Prints "3"
public class BinaryNode<T: Comparable>: Comparable {
    
    public private(set) var data: T
    public var left: BinaryNode?            // For left child node.
    public var right: BinaryNode?           // For right child node.
    
    /// Return the node is whether leaf or not.
    public var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    /// Retrun the height of the node in the three.
    public var height: Int {
        func recursiveFunction(binaryNode: BinaryNode<T>?) -> Int {
            if let node = binaryNode {
                let leftHeight: Int = recursiveFunction(binaryNode: node.left)
                let rightHeight: Int = recursiveFunction(binaryNode: node.right)
                return max(leftHeight, rightHeight) + 1
            }
            else {
                return 0
            }
        }
        return recursiveFunction(binaryNode: self)
    }
    
    /// Set the data want to store and the root of left or right subtree.
    /// - Parameters:
    ///   - data: Any kind of data.
    ///   - left: A left root of subtree.
    ///   - right: A right root of subtree.
    public init(_ data: T, left: BinaryNode<T>? = nil, right: BinaryNode<T>? = nil) {
        self.data = data
        self.left = left
        self.right = right
    }
    
    public static func < (lhs: BinaryNode<T>, rhs: BinaryNode<T>) -> Bool {
        lhs.data < rhs.data
    }
    
    public static func == (lhs: BinaryNode<T>, rhs: BinaryNode<T>) -> Bool {
        lhs.data == rhs.data
    }
}
