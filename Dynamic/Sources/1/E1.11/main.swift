// import
import SimpleMatrix

let matrix = try Matrix(array: [5, 9, 13, 9,
								3, 7, 12, 8,
								10, 11, 13, 11,
								9, 8, 6, 2,
								], n: 4, m: 4)

func findTurtleVerticalPath(paths: Matrix) throws -> [(i:Int, j: Int)] {
	let weight = try Matrix(array: Array(repeating: -1, count: paths.n * paths.m), n: paths.n, m: paths.m)
	for i in 0..<paths.n {
		for j in 0..<paths.m {
			switch (i, j) {
			case (0, _):
				weight[0, j] = paths[0, j]
			case (_, 0):
				weight[i, j] = max(weight[i-1, j], weight[i-1, j+1]) + paths[i, j]
			case (_, paths.m-1):
				weight[i, j] = max(weight[i-1, j-1], weight[i-1, j]) + paths[i, j]
			default:
				weight[i, j] = max(weight[i-1, j-1], weight[i-1, j], weight[i-1, j+1]) + paths[i, j]
			}
		}
	}

	var i = paths.n-1
	var j = 0
	for m in 0..<paths.m {
		if weight[i, j] < weight[i, m] {
			j = m
		}
	}

	var turtleVerticalPath = [(i: Int, j: Int)]()
	while i > 0 {
		turtleVerticalPath.append((i: i, j: j))
		if weight[i, j] - paths[i, j] == weight[i-1, j] {
			j += 0
		}
		else if j > 0, weight[i, j] - paths[i, j] == weight[i-1, j-1] {
			j -= 1
		}
		else if j < paths.m-1, weight[i, j] - paths[i, j] == weight[i-1, j+1] {
			j += 1
		}
		else {
			enum TurtleError: Error {
				case invalidWay
			}
			throw TurtleError.invalidWay
		}
		i -= 1
	}
	turtleVerticalPath.append((i: i, j: j))
	return turtleVerticalPath
}

print(try findTurtleVerticalPath(paths: matrix))
