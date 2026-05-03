import SimpleMatrix

let matrix = try Matrix(array: [5, 9, 13, 9,
								3, 7, 12, 8,
								10, 11, 13, 11,
								9, 8, 6, 2,
								], n: 4, m: 4)

func coutTurtlePaths(paths: Matrix) -> Int {
	var a = 0
	func coutTurtlePaths(i: Int, j: Int) {
		switch (i, j) {
		case (paths.n-1, paths.m-1):
			a += 1
		case (_, paths.m-1):
			coutTurtlePaths(i: i+1, j: j)
		case (paths.n-1, _):
			coutTurtlePaths(i: i, j: j+1)
		default:
			coutTurtlePaths(i: i+1, j: j)
			coutTurtlePaths(i: i, j: j+1)
			coutTurtlePaths(i: i+1, j: j+1)
		}
	}
	coutTurtlePaths(i: 0, j: 0)
	return a
}

print("Кол-во доступных путей при диагональном переходе: \(coutTurtlePaths(paths: matrix))")
