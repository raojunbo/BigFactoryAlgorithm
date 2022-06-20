//
//  Solution33.swift
//  BigFactoryAlgorithm
//
//  Created by junbo.rao on 2022/5/25.
//
// 搜索旋转排序数组
// 可以采用二分搜索，二分搜索的精髓在于怎么分区。
import Foundation
class Solution33 {
//   [4,5,6,7,0,1,2],0
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = (left + right) / 2
            if nums[mid] == target {
                return mid
            }
           // 每次分成两段，有序段，无序段。判定是否在有序段。不在有序段，就在无序段。在重新分区。
            if nums[left] <= nums[mid]  { // 左边有序
                if target >= nums[left] && target < nums[mid] {
                    // 在有序里
                    right = mid - 1
                } else {
                    // 不在有序列表里
                    left = mid + 1
                }
            } else { // 左边无序（右边有序）
                if target > nums[mid] && target <= nums[right] {
                    // 在有序里
                    left = mid + 1
                } else {
                    // 不在有序列表里
                    right = mid - 1
                }
            }
        }
        return -1
    }
    class func test() {
        let solution = Solution33()
        let nums = [4,5,6,7,0,1,2]
        let target = 0
        let result = solution.search(nums, target)
        print(result)
    }
}
