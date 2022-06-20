//
//  Solution235.swift
//  BigFactoryAlgorithm
//
//  Created by junbo.rao on 2022/5/24.
//

import Foundation
// 一般二叉树的公共祖先。
// 二叉搜索树的公共祖先。二叉搜索树可以进行优化。加快搜索进度。
// 左根右。
class Solution235 {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        // 公共祖先在右边
        if root.val < p!.val && root.val < q!.val {
           return lowestCommonAncestor(root.right, p, q)
        }
        // 公共祖先在左边
        if root.val > p!.val && root.val > q!.val {
            return lowestCommonAncestor(root.left, p, q)
        }
        return root
    }
    class func test() {
        let solution = Solution235()
        let node6 = TreeNode(6)
        let node2 = TreeNode(2)
        let node0 = TreeNode(0)
        let node4 = TreeNode(4)
        let node3 = TreeNode(3)
        let node5 = TreeNode(5)
        let node8 = TreeNode(8)
        let node7 = TreeNode(7)
        let node9 = TreeNode(9)
        node6.left = node2
        node2.left = node0
        node2.right = node4
        node4.left = node3
        node4.right = node5
        node6.right = node8
        node8.left = node7
        node8.right = node9
        let reslut = solution.lowestCommonAncestor(node6, node2, node8)
        print(reslut)
    }
}
