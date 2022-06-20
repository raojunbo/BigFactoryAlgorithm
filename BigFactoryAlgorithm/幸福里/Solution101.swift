//
//  Solution101.swift
//  BigFactoryAlgorithm
//
//  Created by junbo.rao on 2022/5/24.
//
// 判定二叉树是否对称。
// 1. 层序遍历
// 2. 递归法，左右两颗子树是否对称
import Foundation
class Solution101 {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isTwoSymmetric(root?.left, root?.right)
    }
    func isTwoSymmetric(_ left: TreeNode?, _ right: TreeNode?) -> Bool{
        if left?.val != right?.val {
            return false
        }
        if left == nil && right == nil {
            return true
        }
        let isLeft = isTwoSymmetric(left?.left, right?.right)
        let isRight = isTwoSymmetric(left?.right, right?.left)
        return isLeft && isRight
    }
}
