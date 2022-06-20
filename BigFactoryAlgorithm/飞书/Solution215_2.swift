//
//  Solution215_2.swift
//  BigFactoryAlgorithm
//
//  Created by junbo.rao on 2022/6/1.
//

import Foundation
// 数组中的第k个最大元素
// 快手排序或者堆排序
class Solution215_2 {
    var result: Int = 0
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        quickSort(&nums, k, start: 0, end: nums.count - 1)
        print(nums)
        return result
    }
    func quickSort(_ nums: inout [Int], _ k: Int, start: Int, end: Int) {
        if start >= end {
            return
        }
        let index = pivot(&nums, start, end)
        if index == nums.count - k {
            return
        }
        quickSort(&nums, k, start: start, end: index - 1)
        quickSort(&nums, k, start: index + 1, end: end)
    }
    // 只要碰见小的就往前移动。最终小的都在前面。大的都在后面。将value放在counter位置。
    func pivot(_ nums: inout [Int], _ start: Int , _ end: Int) -> Int{
        let pivot = end
        var counter = start
        for i in start..<end {
            // 如果当前的值小于基准值。就将a[i]的元素放到a[counter]里
            if nums[i] < nums[pivot] {
                let temp = nums[counter]
                nums[counter] = nums[i]
                nums[i] = temp
                counter += 1
            }
        }
        // 最后将a[pivot]的值与a[counter]位置交换
        let tmp = nums[pivot]
        nums[pivot] = nums[counter]
        nums[counter] = tmp
        return counter
    }
    class func test() {
        let solution = Solution215_2()
        let nums = [3,2,1,5,6,4] , k = 2
        let result = solution.findKthLargest(nums, k)
    }
}
