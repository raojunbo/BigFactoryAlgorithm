//
//  Solution103.swift
//  BigFactoryAlgorithm
//
//  Created by junbo.rao on 2022/5/24.
//

import Foundation
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init() {
        self.val = 0
    }
    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
    init(_ val: Int) {
        self.val = val
    }
}
class Solution103 {
    // 这个直接采用层序遍历就可以了。
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        var result: [[Int]] = []
        var queue: [TreeNode] = []
        queue.append(root)
        var direction = 0 // 向右
        while !queue.isEmpty {
            var size = queue.count
            var array:[Int] = []
            while size > 0 {
                let node = queue.removeFirst()
                if direction == 0 {
                    array.append(node.val)
                } else {
                    array.insert(node.val, at: 0)
                }
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
                size -= 1
            }
            result.append(array)
            direction = (direction + 1) % 2
        }
        return result
    }
    class func test() {
        let solution = Solution103()
        let node3 = TreeNode(3)
        let node9 = TreeNode(9)
        let node20 = TreeNode(20)
        let node15 = TreeNode(15)
        let node7 = TreeNode(7)
        
        node3.left = node9
        node3.right = node20
        node20.left = node15
        node20.right = node7
        
       let result = solution.zigzagLevelOrder(node3)
        print(result)
    }
}
