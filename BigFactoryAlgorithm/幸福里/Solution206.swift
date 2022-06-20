//
//  Solution206.swift
//  BigFactoryAlgorithm
//
//  Created by junbo.rao on 2022/5/24.
//
// 反转链表有两种方法
// 头插法
// 指针法
import Foundation
class ListNode {
    var val: Int
    var next: ListNode?
    init() {
        self.val = 0
    }
    init(_ val: Int) {
        self.val = val
    }
    init(_ val: Int, _ next: ListNode?) {
        self.val = val
    }
}
class Solution206 {
    // 头插法
    func reverseList(_ head: ListNode?) -> ListNode? {
        let vHead = ListNode(-1)
        var cur: ListNode? = head
        while cur != nil {
            let node = cur
            cur = cur?.next
            node?.next = vHead.next
            vHead.next = node
        }
        return vHead.next
    }
    // 双指针法
    func reverseList2(_ head: ListNode?) -> ListNode? {
        var pre: ListNode? = nil
        var cur = head
        while cur != nil {
            let next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        return pre
    }
    // 递归方法
    var lastHead: ListNode?
    func reverseList3(_ head: ListNode?) -> ListNode? {
       p_reverseList3(head)
        return lastHead
    }
    func p_reverseList3(_ head: ListNode?) -> ListNode? {
        if head?.next == nil {
            lastHead = head
            return head
        }
        let node =  p_reverseList3(head?.next)
        node?.next = head
        head?.next = nil
        return head
    }
    
    class func test() {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        let node4 = ListNode(4)
        let node5 = ListNode(5)
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        let solution = Solution206()
        let result = solution.reverseList3(node1)
        print(result)
    }
}
