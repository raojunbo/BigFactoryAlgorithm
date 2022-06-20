//
//  Offer26.swift
//  BigFactoryAlgorithm
//
//  Created by junbo.rao on 2022/6/9.
//

import Foundation

class Offer26 {
    func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        if A != nil && B != nil {
            // 当前节点是否是子树,
            // 不是,A的左边，再次判定是否是子树
            // 不是,A的右边，判定是否是子树
            return isEqu(A, B) || isSubStructure(A?.left, B) || isSubStructure(A?.right, B)
        }
        return  false
    }
    func isEqu(_ A: TreeNode?, _ B: TreeNode?) -> Bool{
        if B == nil {
            return true
        }
        if A == nil {
            return false
        }
        if A?.val != B?.val {
            return false
        }
        return isEqu(A?.left, B?.left) && isEqu(A?.right, B?.right)
    }
    class func test() {
        let solution = Offer26()
        
//        let node3 = TreeNode(3)
//        let node4 = TreeNode(4)
//        let node5 = TreeNode(5)
//        let node1 = TreeNode(1)
//        let node2 = TreeNode(2)
//
//        node3.left = node4
//        node3.right = node5
//        node4.left = node1
//        node4.right = node2
//
//        let node44 = TreeNode(4)
//        let node11 = TreeNode(1)
//        node44.left = node11
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        let node4 = TreeNode(4)
        node1.left = node2
        node2.left = node4
        node1.right = node3
        
        let node44 = TreeNode(3)
        
        let result = solution.isSubStructure(node1, node44)
        print(result)
    }
}
