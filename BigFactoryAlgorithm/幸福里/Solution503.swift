//
//  Solution503.swift
//  BigFactoryAlgorithm
//
//  Created by junbo.rao on 2022/5/27.
//
// 下一个更大的元素
import Foundation
class Solution503 {
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        var stack: [Int] = []
        for i in 0..<nums.count {
            if stack.isEmpty {
                stack.append(nums[i])
            } else {
                let last = stack.last!
                if last < nums[i] {
                    stack.append(nums[i])
                }
            }
        }
        
        var result: [Int] = []
        for i in 0..<nums.count {
            
        }
        
        
        return []
    }
}
