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
            url: "https://github.com/nabil-lahlou-idnow/sunflower-test/releases/download/2.0.0-rc12/SunflowerUIKit.xcframework.zip",
            checksum: "69956412709d0fcb7ddcc7acf905b158e5a7e7604af366e03d56b3181ed08743"
        ),
        .binaryTarget(
            name: "SunflowerSwiftUI",
            url: "https://github.com/nabil-lahlou-idnow/sunflower-test/releases/download/2.0.0-rc12/SunflowerSwiftUI.xcframework.zip",
            checksum: "364c679ce35a12f8a6da8dd632f1908fc33db1bdf5c32466524896431a5fc609"
        ),
        .target(
             // Main target which contains both SunflowerUIKit and the lottie dependency. Automatically downloaded when client fetch Sunflower.
            name: "SunflowerUIKitWrapper",
            dependencies: [
                "SunflowerUIKit",
                .product(name: "Lottie", package: "lottie-spm")
            ],
            path: "sources-uikit"
        ),
        .target(
             // Main target which contains both SunflowerSwiftUI and the lottie dependency. Automatically downloaded when client fetch Sunflower.
            name: "SunflowerSwiftUIWrapper",
            dependencies: [
                "SunflowerSwiftUI",
                .product(name: "Lottie", package: "lottie-spm")
            ],
            path: "sources-swiftui"
        )
    ]
)
