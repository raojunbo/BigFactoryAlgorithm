//
//  Solution215.swift
//  BigFactoryAlgorithm
//
//  Created by junbo.rao on 2022/5/26.
//

import Foundation
// 数组中的第k个最大元素
// 1.快速排序，一次快速排序。确定一个元素。
// 2.堆排序
class Solution215 {
    var result = -1
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        quickSort(&nums, k: k, start: 0, end: nums.count - 1)
        return result
    }
    func quickSort(_ nums: inout [Int], k: Int, start: Int, end: Int) {
        if start > end {
            return
        }
        let index = pivot(nums: &nums, start: start, end: end)
        if k == nums.count - index {
            result = nums[index]
            return
        }
        quickSort(&nums, k: k, start: start, end: index - 1)
        quickSort(&nums, k: k, start: index + 1, end: end)
    }
    
    func pivot(nums: inout [Int], start: Int , end: Int) -> Int{
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
        let solution = Solution215()
        let nums = [3,2,3,1,2,4,5,5,6]
        let result = solution.findKthLargest(nums, 4)
        print(result)
    }
}
