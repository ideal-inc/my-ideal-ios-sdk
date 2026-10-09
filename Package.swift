// swift-tools-version: 5.9
import PackageDescription

let version = "4.0.1"
let checksum = "44b2f5086b879d09d2d2ec473e77539bb063bf6e36d424c0430a9406bf6c10ad"
let url = "https://d3s5ffku8vii2e.cloudfront.net/v\(version)/MyIDEAL.xcframework.zip"

let package = Package(
    name: "MyIDEAL",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "MyIDEAL", targets: ["MyIDEALTarget"]),
    ],
    dependencies: [
        .package(url: "https://github.com/auth0/Auth0.swift", "2.22.0"..<"3.0.0"),
        .package(url: "https://github.com/airbnb/lottie-spm.git", from: "4.3.2"),
    ],
    targets: [
        .target(
            name: "MyIDEALTarget",
            dependencies: [
                "MyIDEALBinary",
                .product(name: "Auth0", package: "Auth0.swift"),
                .product(name: "Lottie", package: "lottie-spm"),
            ],
            path: "Sources/MyIDEAL",
            resources: [
                .process("Resources/Icons.xcassets"),
                .process("Resources/Images.xcassets"),
                .process("Resources/Animations"),
                .process("Resources/PrivacyInfo.xcprivacy"),
            ]
        ),
        .binaryTarget(
            name: "MyIDEALBinary",
            url: url,
            checksum: checksum,
        ),
    ]
)
