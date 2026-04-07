// swift-tools-version: 5.9
import PackageDescription

let version = "0.0.0"
let checksum = "xxxxx"
let url = "https://d3s5ffku8vii2e.cloudfront.net/v\(version)/MyIDEAL.xcframework.zip"

let package = Package(
    name: "MyIDEAL",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "MyIDEAL", targets: ["MyIDEALTargets"]),
    ],
    dependencies: [
        .package(url: "https://github.com/auth0/Auth0.swift", "2.8.0"..<"2.9.0"),
        .package(url: "https://github.com/airbnb/lottie-ios", from: "4.3.0"),
    ],
    targets: [
        .target(
            name: "MyIDEALTargets",
            dependencies: [
                "MyIDEALBinary",
                .product(name: "Auth0", package: "Auth0.swift"),
                .product(name: "Lottie", package: "lottie-ios"),
            ],
            path: "Sources/MyIDEAL",
            resources: [
                .copy("Resources/MyIDEALAssets.bundle"),
                .copy("Resources/MyIDEALAnimations.bundle"),
                .copy("Resources/PrivacyInfo.xcprivacy"),
            ]
        ),
        .binaryTarget(
            name: "MyIDEALBinary",
            url: url,
            checksum: checksum,
        ),
    ]
)
