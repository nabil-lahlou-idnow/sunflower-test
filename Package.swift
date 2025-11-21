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
            url: "https://github.com/nabil-lahlou-idnow/sunflower-test/releases/download//SunflowerUIKit.xcframework.zip",
            checksum: "174c34aa3a46742f5cb2cca5ef78cafc0735c5a3c8d37af5a3a36264072a127c"
        ),
        .binaryTarget(
            name: "SunflowerSwiftUI",
            url: "https://github.com/nabil-lahlou-idnow/sunflower-test/releases/download//SunflowerSwiftUI.xcframework.zip",
            checksum: "915a8b4a83ea7fa28ab6d77dae7e6bab1196da59c219d27cedf4b6be24b52f86"
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
