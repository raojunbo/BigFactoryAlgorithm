//
//  Solution152.swift
//  BigFactoryAlgorithm
//
//  Created by junbo.rao on 2022/5/27.
//

import Foundation

// 定义dpMin[i]表示以i结尾的最小值的dp
// dpMax[i] 表示以i结尾的最大值的dp
// 在 本身，最大值 * 本身，最小值 *本身，三者中间做比较。
class Solution152 {
    func maxProduct(_ nums: [Int]) -> Int {
        var dpMin = Array(repeating: 1, count: nums.count + 1)
        var dpMax = Array(repeating: 1, count: nums.count + 1)
        for i in 1...nums.count {
            // 当前值 与 最小值的乘积
            dpMin[i] = min(nums[i - 1] * dpMin[i - 1], nums[i - 1] * dpMax[i - 1], nums[i - 1])
            dpMax[i] = max(nums[i - 1] * dpMin[i - 1], nums[i - 1] * dpMax[i - 1], nums[i - 1])
        }
        var result = Int.min
        for i in 1...nums.count {
            result = max(result, dpMin[i])
            result = max(result, dpMax[i])
        }
        print(dpMin)
        print(dpMax)
        // 求取数组范围。
        for i in 1..<dpMax.count {
            if dpMax[i] == result {
                let end = i - 1
                var temp = result
                var start = end
                while temp > 1 {
                    temp = temp / nums[start]
                    start -= 1
                    if start < 0 {
                        start = 0
                    }
                }
                print([nums[start],nums[end]])
            }
        }
        return result
    }
    class func test() {
        let solution = Solution152()
        let nums = [2,3,-2,4]
        let result = solution.maxProduct(nums)
        print(result)
    }
}
