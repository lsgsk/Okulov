import Foundation
import SimpleMatrix

let matrix = try Matrix(array: [5, 9, 13, 9,
								3, 7, 12, 8,
								-1, 11, -1, 11,
								9, 8, 6, 2,
								], n: 4, m: 4)

func findTurtleMaxPath(paths: Matrix) throws -> [(i:Int, j: Int)] {
	let weight = try Matrix(array: Array(repeating: 0, count: paths.n * paths.m), n: paths.n, m: paths.m)
	weight[0, 0] = paths[0, 0]
	for i in 1..<paths.n {
		guard paths[i, 0] != -1 else { break }
		weight[i, 0] = paths[i, 0] + weight[i-1, 0]
	}
	for j in 1..<paths.m {
		guard paths[0, j] != -1 else { break }
		weight[0, j] = paths[0, j] + weight[0, j-1]
	}
	for i in 1..<paths.n {
		for j in 1..<paths.m {
			guard paths[i, j] != -1 else { break }
			weight[i, j] = paths[i, j] + max(weight[i-1, j], weight[i, j-1])
		}
	}

	weight.display()

	var path = [(i:Int, j: Int)]()
	var i = paths.n-1
	var j = paths.m-1
	while i != 0 || j != 0 {
		path.append((i: i, j: j))
		switch (i, j, weight[i, j] - paths[i, j]) {
		case (0, _, _): j-=1
		case (_, 0, _): i-=1
		case (_, _, weight[i-1, j]): i-=1
		case (_, _, weight[i, j-1]): j-=1
		default: fatalError("Не удалось построить маршрут черепашки")
		}
	}
	path.append((i: 0, j: 0))
	return path.reversed()
}

print(try findTurtleMaxPath(paths: matrix))
