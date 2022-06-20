//
//  938.二叉搜索树的范围和.swift
//  BigFactoryAlgorithm
//
//  Created by junbo.rao on 2022/6/13.
//

import Foundation

// 二叉搜索树本的中序遍历，本身是升序的。
class Solution938 {
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        
//        guard let root = root else {
//            return 0
//        }
//        var sum = 0
//        if root.val >= low {
//            let leftSum = rangeSumBST(root.left, low, high)
//            sum = sum + leftSum
//        }
//        if root.val <= high {
//            let rightSum = rangeSumBST(root.right, low, high)
//            sum = sum + rightSum
//        }
//        return sum
    }
    class func test() {
        let solution = Solution938()
        let node10 = TreeNode(10)
        let node5 = TreeNode(5)
        let node15 = TreeNode(15)
        let node3 = TreeNode(3)
        let node7 = TreeNode(7)
        let node18 = TreeNode(18)
        
        node10.left = node5
        node5.left = node3
        node5.right = node7
        node10.right = node15
        node15.right = node18
        
        let result = solution.rangeSumBST(node10, 7, 15)
        print(result)
    }
}
