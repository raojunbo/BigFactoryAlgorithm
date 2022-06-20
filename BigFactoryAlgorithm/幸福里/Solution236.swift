//
//  Solution236.swift
//  BigFactoryAlgorithm
//
//  Created by junbo.rao on 2022/5/24.
//
// 二叉树的最近公共祖先
// 两边同时去找这个节点。找到节点后就返回。但两边子树都找到了节点时。
import Foundation
class Solution236 {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        if root === p || root === q {
            return root
        }
        let leftNode = lowestCommonAncestor(root.left, p, q)
        let rightNode = lowestCommonAncestor(root.right, p, q)
        // 两边同时存在时，说明当前节点是最近公共祖先。
        if leftNode != nil && rightNode != nil {
            return root
        } else if leftNode != nil {
            return leftNode
        } else if rightNode != nil {
            return rightNode
        }
        return nil
    }
}
