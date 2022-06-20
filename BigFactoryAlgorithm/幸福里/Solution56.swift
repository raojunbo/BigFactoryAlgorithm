//
//  Solution56.swift
//  BigFactoryAlgorithm
//
//  Created by junbo.rao on 2022/5/27.
//
// 合并区间
// 先按第一位进行排序。
// 在进行合并。
import Foundation
class Solution56 {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count != 0 else {
            return []
        }
        let sorted = intervals.sorted { one, two in
            one[0] < two[0]
        }
        var result: [[Int]] = []
        
        for i in 0..<sorted.count {
            if i == 0 {
                result.append(sorted[i])
                continue
            }
            let last = result.last!
           
            if last[1] >= sorted[i][0] {
                // 需要合并
               let merged = [last[0], max(last[1], sorted[i][1])]
                result.removeLast()
                result.append(merged)
            } else {
                // 不需要合并
                result.append(sorted[i])
            }
        }
        return result
    }
    
    class func test() {
        let intervals =  [[4,5],[1,4]]
        let solution = Solution56()
        let result = solution.merge(intervals)
        print(result)
    }
}
