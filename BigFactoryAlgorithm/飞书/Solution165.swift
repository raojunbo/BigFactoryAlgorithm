//
//  Solution165.swift
//  BigFactoryAlgorithm
//
//  Created by junbo.rao on 2022/6/1.
//

import Foundation
class Solution165 {
    // 2. 双指针法
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        var p1 = 0
        var p2 = 0
        while p1 < version1.count || p2 < version2.count {
            var p1Value = 0
            // 获取第一段
            while p1 < version1.count {
                let startIndex = version1.index(version1.startIndex, offsetBy: p1)
                let endIndex = version1.index(startIndex, offsetBy: 1)
                let indexValue = String(version1[startIndex..<endIndex])
                p1 += 1
                if indexValue != "." {
                    p1Value = p1Value * 10 + Int(indexValue)!
                } else {
                    break
                }
            }
            var p2Vlue = 0
            // 获取第二段
            while p2 < version2.count {
                let startIndex = version2.index(version2.startIndex, offsetBy: p2)
                let endIndex = version2.index(startIndex, offsetBy: 1)
                let indexValue = String(version2[startIndex..<endIndex])
                p2 += 1
                if indexValue != "." {
                    p2Vlue = p2Vlue * 10 + Int(indexValue)!
                } else {
                    break
                }
            }
            if p1Value < p2Vlue {
                return -1
            } else if p1Value > p2Vlue {
                return 1
            }
        }
        return 0
    }
    
    class func test() {
        let solution = Solution165()
        var version1 =  "1", version2 =  "1.1"
        
        let result = solution.compareVersion(version1, version2)
        print(result)
    }
}
