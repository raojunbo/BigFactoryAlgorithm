//
//  Offer07.swift
//  BigFactoryAlgorithm
//
//  Created by junbo.rao on 2022/5/24.
//

import Foundation
// 二叉树的前序遍历与中序遍历的结果构建二叉树
// 前序遍历 根左右, 确定根
// 中序遍历 左根右，确定区间
class Offer07 {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var preorder = preorder
        var inorder = inorder
        return recurseBuildTree(&preorder, &inorder, preStart: 0, preEnd: preorder.count - 1, inStart: 0, inEnd: inorder.count - 1)
    }
    func recurseBuildTree(_ preorder: inout [Int], _ inorder: inout [Int],
                   preStart: Int, preEnd: Int,
                   inStart: Int, inEnd: Int) -> TreeNode? {
        guard preStart <= preEnd else {
            return nil
        }
        guard inStart <= inEnd else {
            return nil
        }
        let root = preorder[preStart]
        let indexInOrder = findIndexInOrder(value: root, inStart: inStart, inEnd: inEnd, inOrder: &inorder)
        let length = indexInOrder - inStart // 不包括根节点的左子树节点个数
        let node = TreeNode(root)
//        preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
        node.left = recurseBuildTree(&preorder, &inorder, preStart: preStart + 1, preEnd: preStart + length, inStart: inStart, inEnd: indexInOrder - 1)
        node.right = recurseBuildTree(&preorder, &inorder, preStart: preStart + length + 1, preEnd: preEnd, inStart: indexInOrder + 1, inEnd: inEnd)
        return node
    }
    func findIndexInOrder(value: Int, inStart: Int, inEnd: Int ,inOrder: inout [Int]) -> Int {
        var index = inStart
        for i in inStart...inEnd {
            if inOrder[i] == value {
                index = i
                break
            }
        }
        return index
    }
    class func test() {
        let preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
        let solution = Offer07()
        let result =  solution.buildTree(preorder, inorder)
        print(result)
    }
}
