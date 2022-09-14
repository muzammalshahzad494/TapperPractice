//
//  ArraysViewController.swift
//  Tapper Practice
//
//  Created by Emblem Technologies on 07/09/2022.
//

import UIKit
import Foundation

class ArraysViewController: UIViewController {

    var nums = [1]
    var str = "PAHNAPLSIIGYIR"
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCode()
//        convert(str, 1)
        
    }
    
   
}



























//Value type
//> Class
//> Struct
//> Enum

enum BinaryTree<T>{
    case empty
    indirect case node(BinaryTree, T, BinaryTree)
}

//Leaf Node
let node5 = BinaryTree.node(.empty, "5", .empty)
let nodeA = BinaryTree.node(.empty, "a", .empty)
let node10 = BinaryTree.node(.empty, "10", .empty)
let node4 = BinaryTree.node(.empty, "4", .empty)
let node3 = BinaryTree.node(.empty, "3", .empty)
let nodeB = BinaryTree.node(.empty, "b", .empty)

//Intermediate node on the left
let Aminus10 = BinaryTree.node(nodeA, "-", node10)
let timesLeft = BinaryTree.node(node5, "*", Aminus10)

// intermediate nodes on the right
let minus4 = BinaryTree.node(.empty, "-", node4)
let divide3andB = BinaryTree.node(node3, "/", nodeB)
let timesRight = BinaryTree.node(minus4, "*", divide3andB)

// root node
let tree = BinaryTree.node(timesLeft, "+", timesRight)


extension BinaryTree: CustomStringConvertible {
    var description: String {
        switch self {
        case let .node(left, value, right):
            return "value: \(value), left = [" + left.description + "], right = [" + right.description + "]"
        case .empty:
            return ""
        }
    }
    
    var count: Int {
        switch self {
        case let .node(left, _, right):
            return left.count + 1 + right.count
        case .empty:
            return 0
        }
    }
    
//    print(tree)
}








class Node<T>{
    var value: T
    var leftChild : Node?
    var rightChild: Node?
    
    init(value: T) {
        self.value = value
    }
}


extension ArraysViewController{
    
    func setupCode(){
        view.backgroundColor = .red
        pivotIndex([1,7,3,6,5,6])
    }
    
    func pivotIndex(_ nums: [Int]) -> Int {
       var leftSum = nums
       guard !nums.isEmpty else{
           return -1
       }
           
       for i in 0..<nums.count-1 {
           leftSum[i + 1] += leftSum[i]
       }
       print(leftSum)
       leftSum.insert(0, at: 0)
           
           
       var rightSum = nums
       for i in (0..<nums.count-1).reversed() {
           rightSum[i] += rightSum[i + 1]
       }
       print(leftSum)
       rightSum.append(0)
           
       for i in nums.indices {
           if leftSum[i] == rightSum[i + 1] {
               return i
           }
       }
         return -1
       }

}
