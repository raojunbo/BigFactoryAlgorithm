//
//  Solution64.swift
//  BigFactoryAlgorithm
//
//  Created by junbo.rao on 2022/5/27.
//
// 最小路径和。
// dp[i][j] 路径和 dp[i][j] = min(dp[i-1][j], dp[i][j + 1])
import Foundation
class Solution64 {
    // 生出输出路径
    func minPathSum2(_ grid: [[Int]]) -> Int {
        let row = grid.count
        let col = grid[0].count
        let line = Array(repeating: Int.max, count: col )
        var dp = Array(repeating: line, count: row)
       
        
        dp[0][0] = grid[0][0]
        for j in 1..<col {
            dp[0][j] = dp[0][j - 1] + grid[0][j]
        }
        for i in 1..<col {
            dp[i][0] = dp[i - 1][0] + grid[i][0]
        }
        for i in 0..<row {
            for j in 0..<col {
                if i == 0 || j == 0 {
                    continue
                }
                dp[i][j] = min(dp[i - 1][j], dp[i][j - 1] ) + grid[i][j]
            }
        }
        // 求出路径
        var result: [Int] = []
        var i = row - 1
        var j = col - 1
        result.append(grid[i][j])
        while i >= 0, j >= 0 {
            // 到了最后一个点跳出
            if i == 0 && j == 0 {
                break
            }
            // 第一行
            if i == 0 {
                result.append(grid[0][j - 1])
                j = j - 1
                continue
            }
            // 最左列
            if j == 0 {
                result.append(grid[i - 1][0])
                i = i - 1
                continue
            }
            if dp[i - 1][j] <= dp[i][j - 1] {
                result.append(grid[i - 1][j])
                i = i - 1
            } else {
                result.append(grid[i][j - 1])
                j = j - 1
            }
        }
        print(result)
        return dp[row - 1][col - 1]
    }
    class func test() {
        let solution = Solution64()
        let grid = [[1,3,1],[1,5,1],[4,2,1]]
        let result = solution.minPathSum2(grid)
        print(result)
    }
}
