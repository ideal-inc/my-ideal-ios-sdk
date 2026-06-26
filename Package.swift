// swift-tools-version: 5.9
import PackageDescription

let version = "3.0.0"
let checksum = "81436087407ee11e7b0d8494f652da47d9676bcdaa619f449516202511e0c4f7"
let url = "https://d3s5ffku8vii2e.cloudfront.net/v\(version)/MyIDEAL.xcframework.zip"

let package = Package(
    name: "MyIDEAL",
    platforms: [.iOS(.v13)],
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
