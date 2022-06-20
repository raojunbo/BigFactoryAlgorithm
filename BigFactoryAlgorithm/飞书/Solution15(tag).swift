//
//  Solution15.swift
//  BigFactoryAlgorithm
//
//  Created by junbo.rao on 2022/6/2.
//

import Foundation
class Solution15 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var result: [[Int]] = []
        // -nums[i]为target。然后再后面用序数组中通过双指针夹逼。
        for i in 0..<nums.count {
            // 横向去重
            if i >= 1 && nums[i] == nums[i - 1] {
                continue
            }
            // first,为左边开始，second为右边开始
            let target = -nums[i]
            var second = nums.count - 1
            for first in i+1..<nums.count {
                // 横向去重
                if first > i + 1 && nums[first] == nums[first - 1] {
                    continue
                }
                // 太大
                while(first < second && nums[first] + nums[second] > target) {
                    second -= 1
                }
                if first == second {
                    break
                }
                if nums[first] + nums[second] == target {
                    result.append([nums[i], nums[first], nums[second]])
                }
            }
        }
        return result
    }
    class func test() {
        let solution = Solution15()
        let nums = [-1,0,1,2,-1,-4]
        let result = solution.threeSum(nums)
        print(result)
    }
}
