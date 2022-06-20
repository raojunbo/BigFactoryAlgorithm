//
//  Solution160.swift
//  BigFactoryAlgorithm
//
//  Created by junbo.rao on 2022/5/26.
//
// 判定两个链表
import Foundation
class Solution160 {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var cur1 = headA
        var cur2 = headB
        // 不会出现死循环。因为cur1与cur2最终会不一样。
        while cur1 !== cur2 {
            if cur1 == nil {
                cur1 = headB
            } else {
                cur1 = cur1?.next
            }
            if cur2 == nil {
                cur2 = headA
            } else {
                cur2 = cur2?.next
            }
        }
        return cur2
    }
    class func test() {
        let solution = Solution160()
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        
        let node3 = ListNode(3)
        let node4 = ListNode(4)
        let node5 = ListNode(5)
        
        let node11 = ListNode(11)
        let node12 = ListNode(12)
        let node13 = ListNode(13)
        
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        
        node11.next = node12
        node12.next = node13
//        node13.next = node3
        
        
        let node = solution.getIntersectionNode(node1, node11)
        print(node?.val)
    }
}
