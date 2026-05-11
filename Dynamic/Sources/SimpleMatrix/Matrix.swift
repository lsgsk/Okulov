import Foundation

public final class Matrix {
	public enum MatrixError: Error {
		case invalid
	}
	
	public let n: Int
	public let m: Int
	private var array: [Int]

	public init(array: [Int], n: Int, m: Int) throws(MatrixError) {
		guard array.count == (n * m) else { throw .invalid }
		self.n = n
		self.m = m
		self.array = array
	}

	public subscript(_ i: Int, _ j: Int) -> Int {
		get { self.array[i * self.m + j] }
		set { self.array[i * self.m + j] = newValue }
	}

	public func display() {
		var line = ""
		for i in 0..<self.n {
			for j in 0..<self.m {
				line += String(format: "%-4d", self.array[i * self.m + j])
			}
			line += "\n"
		}
		print("\(line)")
	}
}
