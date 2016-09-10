import PackageDescription

let package = Package(
    name: "tcp-example",
	dependencies: [
		.Package(url: "../TCP", majorVersion: 0)
	]
)
