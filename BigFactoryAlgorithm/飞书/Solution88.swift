//
//  Solution88.swift
//  BigFactoryAlgorithm
//
//  Created by junbo.rao on 2022/6/1.
//

import Foundation
class Solution88 {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var total = nums1.count - 1
        var p1 = m - 1
        var p2 = n - 1
        func backNum2() {
            nums1[total] = nums2[p2]
            p2 -= 1
            total -= 1
        }
        func backNum1() {
            nums1[total] = nums1[p1]
            p1 -= 1
            total -= 1
        }
        while total >= 0 {
            if p1 < 0 && p2 < 0 {
                return
            }
            if p1 < 0 {
                backNum2()
                continue
            }
            if p2 < 0 {
                backNum1()
                continue
            }
            if nums1[p1] < nums2[p2] {
                backNum2()
            } else {
                backNum1()
            }
        }
    }
    // 合并两个有序数组
    // 采用双指针法，从后向前。填入数组1
    class func test() {
        let solution = Solution88()
        var nums1 =  [1,2,3,0,0,0], m = 3, nums2 =  [4,5,6], n = 3
        solution.merge(&nums1, m, nums2, n)
        print(nums1)
    }
}
