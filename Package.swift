// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "Iridis",
    platforms: [.iOS(.v18), .macOS(.v15)],
    products: [.library(name: "Iridis", targets: ["Iridis"])],
    targets: [
        .target(name: "Iridis"),
        .testTarget(name: "IridisTests", dependencies: ["Iridis"]),
    ],
    swiftLanguageModes: [.v6]
)
