//
//  Solution442.swift
//  BigFactoryAlgorithm
//
//  Created by junbo.rao on 2022/6/9.
//

import Foundation
class Solution442 {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var nums = nums
        var result:[Int] = []
        for i in 0..<nums.count {
            // 不断地交换，知道找到nums[i]位置为
            while nums[i] != nums[nums[i] - 1] {
                let tmp = nums[nums[i] - 1]
                nums[nums[i] - 1] = nums[i]
                nums[i] = tmp
            }
        }
        for i in 0..<nums.count {
            if nums[i] - 1 != i {
                result.append(nums[i])
            }
        }
        return result
    }
    class func test(){
        let solution = Solution442()
        let nums = [4,3,2,7,8,2,3,1]
        let result = solution.findDuplicates(nums)
        print(result)
    }
}
