import Foundation
import SimpleMatrix

let n = 3

let edges = try Edges(array: [
//  1  2  3  4  5  6  7  8  9
	0, 8, 0, 7, 0, 0, 0, 0, 0, // 1
	8, 0, 4, 0, 5, 0, 0, 0, 0, // 2
	0, 4, 0, 0, 0, 9, 0, 0, 0, // 3
	7, 0, 0, 0, 1, 0, 3, 0, 0, // 4
	0, 5, 0, 1, 0, 4, 0, 2, 0, // 5
	0, 0, 9, 0, 4, 0, 0, 0, 5, // 6
	0, 0, 0, 3, 0, 0, 0, 4, 0, // 7
	0, 0, 0, 0, 2, 0, 4, 0, 7, // 8
	0, 0, 0, 0, 0, 5, 0, 7, 0, // 9
])

func findTurtleMaxPath(edges: Edges, n: Int, m: Int) throws -> Int {
	let weight = try Matrix(array: Array(repeating: -1, count: n * m), n: n, m: n)
	weight[0, 0] = 0
	for i in 1..<n {
		let to = i * n + 0
		let from = (i - 1) * n + 0
		weight[i, 0] = edges[from, to] + weight[i-1, 0]
	}
	for j in 1..<m {
		let to = 0 * m + j
		let from = 0 * m + j - 1
		weight[0, j] = edges[from, to] + weight[0, j-1]
	}
	for i in 1..<n {
		for j in 1..<m {
			let to = i * n + j
			let fromLeft = i * n + j - 1
			let fromDown = (i - 1) * 3 + j
			weight[i, j] = max(weight[i-1, j] + edges[fromDown, to], weight[i, j-1] + edges[fromLeft, to])
		}
	}
	return weight[n-1, n-1]
}

print(try findTurtleMaxPath(edges: edges, n: 3, m: 3))
