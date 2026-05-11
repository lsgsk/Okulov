import Foundation

public final class Edges {
	public enum EdgesError: Error {
		case invalid
	}

	public let n: Int
	private var array: [Int]

	public init(array: [Int]) throws(EdgesError) {
		self.n = Int(sqrt(Double(array.count)))
		guard n * n == array.count else { throw .invalid }
		self.array = array
	}

	public subscript(_ i: Int, _ j: Int) -> Int {
		get { self.array[i * self.n + j] }
		set { self.array[i * self.n + j] = newValue }
	}

	public func display() {
		var line = ""
		for i in 0..<self.n {
			for j in 0..<self.n {
				line += String(format: "%-4d", self.array[i * self.n + j])
			}
			line += "\n"
		}
		print("\(line)")
	}
}
