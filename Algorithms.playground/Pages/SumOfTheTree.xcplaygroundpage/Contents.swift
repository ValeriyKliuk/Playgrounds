//: [Previous](@previous)

import Foundation

// MARK: - Task definition

/// root = 1
///     /   \
///    2      5
///   /   \
///  3      4
///
///  Sum example:
///  123 + 124 + 15 = 262

// MARK: Node

/// Node class: represents a tree node
/// - parameters:
/// - left: The left Node of the tree, optional
/// - right:    The right Node of the tree, optional
/// - value:    The value of the Node
class Node {
    let left: Node?
    let right: Node?
    let value: Int
    
    init(left: Node?, right: Node?, value: Int) {
        self.value = value
        self.left = left
        self.right = right
    }
}

// MARK: - Sum calculation function

/// Calculating the total of the tree
/// function calc
/// - parameter tree: Node
/// - parameter total: Int
func calc(of tree: Node, total: Int) -> Int {
    if tree.left == nil && tree.right == nil {
        print("total: \(total)")
        return total
    }

    var leftSum = 0
    var rightSum = 0
    
    if let leftTree = tree.left {
        leftSum = calc(of: leftTree, total: total * 10 + leftTree.value)
        print("leftSum: \(leftSum)")
    }
       
    if let rightTree = tree.right {
        rightSum = calc(of: rightTree, total: total * 10 + rightTree.value)
        print("rightSum: \(rightSum)")
    }
    
    return leftSum + rightSum
}

// MARK: - init tree

let leftNode = Node(
    left: Node(left: nil, right: nil, value: 3),
    right: Node(left: nil, right: nil, value: 4),
    value: 2)
let rightNode = Node(left: nil, right: nil, value: 5)
let rootNode = Node(left: leftNode, right: rightNode, value: 1)

// MARK: - calculate total

let total = calc(of: rootNode, total: rootNode.value)

// MARK: - print total

print("Sum of the tree: \(total)")


//: [Next](@next)
