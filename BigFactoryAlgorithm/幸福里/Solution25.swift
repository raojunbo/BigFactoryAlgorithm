//
//  Solution25.swift
//  BigFactoryAlgorithm
//
//  Created by junbo.rao on 2022/5/24.
//
// k个一组反转链表。
// 采用双指针法。记住开头与结尾。
import Foundation
class Solution25 {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var pre:ListNode? = ListNode(-1)
        pre?.next = head
        let newHead = pre
        
        var tail = head
        while tail != nil {
            // 检测是否足够k。
            for _ in 0..<k-1 {
                tail = tail?.next
                if tail == nil {
                    return newHead?.next
                }
            }
            // 反转分组
            let nextGroupHead = tail?.next // 下一个分组的头
            let thisGroupHead = pre?.next // 这个分组的头
            
            let node = reverse(thisGroupHead, k) // 反转指定头的k长度的链表
            pre?.next = node // 链接上已经反转的组
            thisGroupHead?.next = nextGroupHead // 未反转前本分组的头，现在到了最后面，与下一个分组链接上
            
            pre = thisGroupHead // 重新设置pre
            tail = nextGroupHead // 重新设置cur

        }
        return newHead?.next
    }
    func reverse(_ node: ListNode?, _ k: Int) -> ListNode? {
        var pre: ListNode?
        var cur = node
        var m = k
        while m > 0 {
            let next = cur?.next // 下一个节点
            cur?.next = pre // 当前节点指向前一个节点
            pre = cur // 前一个节点变成当前节点
            cur = next // 当前节点变成喜下一个节点
            m -= 1
        }
        return pre
    }
    class func test() {
        let solution = Solution25()
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        let node4 = ListNode(4)
        let node5 = ListNode(5)
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        let result = solution.reverseKGroup(node1, 2)
        print(result)
    }
}
