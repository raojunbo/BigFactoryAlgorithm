//
//  Solution53.swift
//  BigFactoryAlgorithm
//
//  Created by junbo.rao on 2022/5/24.
//

import Foundation
// 定义dp[i]表示以dp结尾的子数组的最大值。
class Solution53 {
    func maxSubArray(_ nums: [Int]) -> Int {
        var result = 0
        if nums.count <= 0 {
            return result
        }
        var dp = Array(repeating: 0, count: nums.count)
        for i in 1..<nums.count {
            dp[i] = max(nums[i], nums[i] + dp[i - 1])
            result = max(result, dp[i])
        }
        return result
    }
    class func test() {
        let solution = Solution53()
        let nums = [1]
        let result = solution.maxSubArray(nums)
        print(result)
    }
}
