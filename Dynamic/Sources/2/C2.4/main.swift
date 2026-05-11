import SimpleMatrix

func fib(n: Int) -> Int {
	guard n > 0 else { return 0 }
	guard n > 2 else { return 1 }
	guard n<=92 else { fatalError("Недопустимо большое число") }
	var fibs = Array(repeating: 0, count: n+1)
	fibs[1] = 1
	fibs[2] = 1
	func fib(_ n: Int, _ fibs: inout [Int]) -> Int {
		if fibs[n] == 0 {
			fibs[n] = fib(n-2, &fibs) + fib(n-1, &fibs)
		}
		return fibs[n]
	}
	return fib(n, &fibs)
}

print(fib(n: 10))

let paths = try Matrix(array: [5, 9, 13, 9,
							   3, 7, 12, 8,
							   10, 11, 13, 11,
							   9, 8, 6, 2,
							  ], n: 4, m: 4)

func findTurtleMaxFor(paths: Matrix) -> Int {
	func cost(_ i: Int, _ j: Int, _ weight: inout Matrix) -> Int {
		if i < 0 || j < 0 {
			return 0
		}
		if weight[i, j] == -1 {
			weight[i, j] = paths[i, j] + max(cost(i - 1, j, &weight), cost(i, j - 1, &weight))
		}
		return weight[i, j]
	}
	var weight = try! Matrix(array: Array(repeating: -1, count: paths.n * paths.m), n: paths.n, m: paths.m)
	return cost(paths.n-1, paths.m-1, &weight)
}

print(findTurtleMaxFor(paths: paths))
