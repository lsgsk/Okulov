// swift-tools-version: 6.2
import PackageDescription

let package = Package(
	name: "Dynamic",
	products: [
		.executable(name: "C1.1", targets: ["C1.1"]),
		.executable(name: "C1.2", targets: ["C1.2"]),
		.executable(name: "C1.3", targets: ["C1.3"]),
		.executable(name: "C1.4", targets: ["C1.4"]),
		.executable(name: "E1.1", targets: ["E1.1"]),
		.executable(name: "E1.2", targets: ["E1.2"]),
		.executable(name: "E1.4", targets: ["E1.4"]),
		.executable(name: "E1.5", targets: ["E1.5"]),
		.executable(name: "E1.7", targets: ["E1.7"]),
		.executable(name: "E1.8", targets: ["E1.8"]),
		.executable(name: "E1.9", targets: ["E1.9"]),
		.executable(name: "E1.10", targets: ["E1.10"]),
	],
	targets: [
		.target(name: "Matrix"),
		.target(name: "SimpleMatrix"),
		// Глава 1
		.executableTarget(name: "C1.1", path: "Sources/1/C1.1"),
		.executableTarget(name: "C1.2", path: "Sources/1/C1.2"),
		.executableTarget(name: "C1.3", dependencies: ["Matrix"], path: "Sources/1/C1.3"),
		.executableTarget(name: "C1.4", dependencies: ["Matrix"], path: "Sources/1/C1.4"),
		.executableTarget(name: "E1.1", dependencies: ["Matrix"], path: "Sources/1/E1.1"),
		.executableTarget(name: "E1.2", dependencies: ["Matrix"], path: "Sources/1/E1.2"),
		.executableTarget(name: "E1.4", path: "Sources/1/E1.4"),
		.executableTarget(name: "E1.5", path: "Sources/1/E1.5"),
		.executableTarget(name: "E1.7", dependencies: ["SimpleMatrix"], path: "Sources/1/E1.7"),
		.executableTarget(name: "E1.8", dependencies: ["SimpleMatrix"], path: "Sources/1/E1.8"),
		.executableTarget(name: "E1.9", dependencies: ["SimpleMatrix"], path: "Sources/1/E1.9"),
		.executableTarget(name: "E1.10", dependencies: ["SimpleMatrix"], path: "Sources/1/E1.10"),
		.testTarget(name: "C1.3T", dependencies: ["C1.3", "Matrix"], path: "Tests/1/C1.3T"),
		.testTarget(name: "C1.4T", dependencies: ["C1.4", "Matrix"], path: "Tests/1/C1.4T"),
		.testTarget(name: "E1.1T", dependencies: ["E1.1", "Matrix"], path: "Tests/1/E1.1T"),
		.testTarget(name: "E1.2T", dependencies: ["E1.2", "Matrix"], path: "Tests/1/E1.2T"),
		.testTarget(name: "E1.4T", dependencies: ["E1.4"], path: "Tests/1/E1.4T"),
		.testTarget(name: "E1.5T", dependencies: ["E1.5"], path: "Tests/1/E1.5T"),
	]
)
