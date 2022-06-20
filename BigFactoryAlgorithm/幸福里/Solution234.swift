//
//  Solution234.swift
//  BigFactoryAlgorithm
//
//  Created by junbo.rao on 2022/5/25.
//

import Foundation
class Solution234 {
    // 回文链表。
    func isPalindrome(_ head: ListNode?) -> Bool {
        // 1. 找到回文处。
        // 2. 反正后面的
        // 3. 对比两个链表
        let vHead = ListNode(-1)
        vHead.next = head
        var slow: ListNode? = vHead
        var fast: ListNode? = vHead
        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        // 反转后的的链表
        let node = reverse2(slow)
        // 比较
        var firstCur = head
        var secondCur = node
        while firstCur != nil && secondCur != nil {
            if firstCur?.val != secondCur?.val {
                return false
            }
            firstCur = firstCur?.next
            secondCur = secondCur?.next
        }
        return true
    }
    // 头插法反转
    func reverse(_ node: ListNode?) -> ListNode? {
        let vHead = ListNode(-1)
        var cur = node?.next
        while cur != nil {
            let next = cur?.next
            let vHeadNext = vHead.next
            vHead.next = cur
            cur?.next = vHeadNext
            cur = next
        }
        return vHead.next
    }
    // 双指针法反转
    func reverse2(_ node: ListNode?) -> ListNode? {
        var pre: ListNode?
        var cur = node?.next
        while cur != nil {
            let next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        return pre
    }
    class func test() {
        let solution = Solution234()
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(2)
        let node4 = ListNode(1)
        node1.next = node2
        node2.next = node3
        node3.next = node4
        let result = solution.isPalindrome(node1)
        print(result)
    }
}
