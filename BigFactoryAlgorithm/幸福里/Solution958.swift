//
//  Solution958.swift
//  BigFactoryAlgorithm
//
//  Created by junbo.rao on 2022/5/27.
//
// 二叉树的完全性检验
// 只需要采用层序遍历。判定前一个节点是否是满的。不是满的看看后面的所有节点是否为nil。
import Foundation
class Solution958 {
    func isCompleteTree(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return false
        }
        var queue: [TreeNode] = []
        queue.append(root)
        var beforeNoSub = false// 前面没有子节点
        while !queue.isEmpty {
            var size = queue.count
            while size > 0 {
                let first = queue.removeFirst()
                print(first.val)
                // 左边无值，右边有值
                if first.left == nil && first.right != nil {
                    return false
                }
                
                // 前面已经无子节点，后面兄弟又子节点
                if beforeNoSub && (first.left != nil || first.right != nil) {
                    return false
                }
               
                // 左边无值，右边也无值
                if first.left == nil && first.right == nil {
                    beforeNoSub = true
                }
                if first.left != nil && first.right == nil {
                    beforeNoSub = true
                }
                
                if let left = first.left {
                    queue.append(left)
                }
                if let right = first.right {
                    queue.append(right)
                }
                size -= 1
            }
        }
        return true
    }
    class func test() {
        let solution = Solution958()
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        let node5 = TreeNode(5)
        let node7 = TreeNode(7)
        let node8 = TreeNode(8)
        
        node1.left = node2
        node1.right = node3
        node2.left = node5
        node3.left = node7
        node3.right = node8
        
//        let node1 = TreeNode(1)
//        let node2 = TreeNode(2)
//        let node3 = TreeNode(3)
//        let node4 = TreeNode(4)
//        let node5 = TreeNode(5)
//        let node6 = TreeNode(6)
//        node1.left = node2
//        node1.right = node3
//        node2.left = node4
//        node2.right = node5
//        node3.left = node6
//        let node1 = TreeNode(1)
//        let node2 = TreeNode(2)
//        let node3 = TreeNode(3)
//        let node4 = TreeNode(4)
//        let node5 = TreeNode(5)
//        let node7 = TreeNode(7)
//        node1.left = node2
//        node1.right = node3
//        node2.left = node4
//        node2.right = node5
//        node3.right = node7
        let result = solution.isCompleteTree(node1)
        print(result)
    }
}
