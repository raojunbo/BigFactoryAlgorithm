//
//  Solution300.swift
//  BigFactoryAlgorithm
//
//  Created by junbo.rao on 2022/5/24.
//

import Foundation

// 最长递增子序列采用动态规划
// 定义dp[i] 表示以dp[i]为结尾的最长递增子序列长度。
class Solution300 {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var result = 1
        var dp = Array(repeating: 0, count: nums.count)
        dp[0] = 1
        for i in 0..<nums.count {
            for j in 0..<i {
                if nums[i] > nums[j] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
            if dp[i] > result {
                result = dp[i]
            }
        }
        return result
    }
    class func test() {
        let solution = Solution300()
        let nums = [4,10,4,3,8,9]
        let result = solution.lengthOfLIS(nums)
        print(result)
        
        
        
        // 降雨量
        // openGL 画cpu。
        // buffer c
    }
}
// um
// 飞书

