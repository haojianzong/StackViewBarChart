// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "StackViewBarChart",
    platforms: [.iOS(.v13)],
    products: [.library(name: "StackViewBarChart", targets: ["StackViewBarChart"])],
    targets: [.target(name: "StackViewBarChart")]
)
