// swift-tools-version: 5.9
import PackageDescription

let version = "3.0.5"
let checksum = "5b3a06a7db88fce59c999d4586331b84e962ddbbb6b1233f41fd50672e09114e"
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
