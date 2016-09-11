import PackageDescription

let package = Package(
    name: "tcp-example",
    dependencies: [
        .Package(url: "https://github.com/VeniceX/TCP.git", majorVersion: 0, minor: 10)
    ]
)
