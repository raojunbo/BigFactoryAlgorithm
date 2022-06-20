//
//  Solution97.swift
//  BigFactoryAlgorithm
//
//  Created by junbo.rao on 2022/6/1.
//

import Foundation

// 我们定义 f(i, j)f(i,j) 表示 s_1s的前 ii 个元素和 s_2s的前 jj 个元素是否能交错组成 s_3s的前 i + ji+j 个元素
// dp[i][j] = dp[i - 1][j] && s1[i - 1] == s3[i + j - 1] || dp[i][j - 1] && s2[i - 1] == s3[i + j - 1]
// 这道题只需要做个转换就可以了。
class Solution97 {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        let s1 = Array(s1), s2 = Array(s2), s3 = Array(s3), row = s1.count, col = s2.count
        guard s1.count + s2.count == s3.count else {
            return false
        }
        var table = [[Bool]](repeating: [Bool](repeating: false, count: col + 1), count: row + 1)
        table[0][0] = true
        for i in 0...row {
            for j in 0...col {
                var result = table[i][j]
                if i > 0 && s1[i - 1] == s3[i + j - 1] {
                    result = result || table[i - 1][j]
                }
                if j > 0 && s2[j - 1] == s3[i + j - 1] {
                    result = result || table[i][j - 1]
                }
                table[i][j] = result
            }
        }
        return table[row][col]
    }
    class func test() {
        let solution = Solution97()
        let s1 = "", s2 = "", s3 = "a"
        let result = solution.isInterleave(s1, s2, s3)
        print(result)
    }
}
