// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Sunflower",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "SunflowerUIKit",
            targets: ["SunflowerUIKitWrapper"]
        ),
        .library(
            name: "SunflowerSwiftUI",
            targets: ["SunflowerSwiftUIWrapper"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-spm.git", exact: "4.5.2")
    ],
    targets: [
        .binaryTarget(
            name: "SunflowerUIKit",
            url: "https://github.com/idnow/sunflower-sdk-ios/releases/download/1.4.12/SunflowerUIKit.xcframework.zip",
            checksum: "a090647cea4cde84fcb1b334b6018c4841ef6761699cbc749c0fb617f12ff95b"
        ),
        .binaryTarget(
            name: "SunflowerSwiftUI",
            url: "https://github.com/nabil-lahlou-idnow/sunflower-test.git/releases/download/2.0.0-rc3/SunflowerSwiftUI.xcframework.zip",
            checksum: "a03c8efeee5e499707dd26819a0e8d2f89ac931df11ef7604f713eacd45d72c9"
        ),
        .target(
             // Main target which contains both SunflowerUIKit and the lottie dependency. Automatically downloaded when client fetch Sunflower.
            name: "SunflowerUIKitWrapper",
            dependencies: [
                "SunflowerUIKit",
                .product(name: "Lottie", package: "lottie-spm")
            ],
            path: "sources"
        ),
        .target(
             // Main target which contains both SunflowerSwiftUI and the lottie dependency. Automatically downloaded when client fetch Sunflower.
            name: "SunflowerSwiftUIWrapper",
            dependencies: [
                "SunflowerSwiftUI",
                .product(name: "Lottie", package: "lottie-spm")
            ],
            path: "sources"
        )
    ]
)
