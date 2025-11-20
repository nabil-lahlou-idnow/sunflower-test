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
            url: "https://github.com/nabil-lahlou-idnow/sunflower-test/releases/download/2.0.0-rc8/SunflowerUIKit.xcframework.zip",
            checksum: "22f3c0440eb777727281f7b52a0f8ef9cb791b1afed16d0d352b339725b43ef0"
        ),
        .binaryTarget(
            name: "SunflowerSwiftUI",
            url: "https://github.com/nabil-lahlou-idnow/sunflower-test/releases/download/2.0.0-rc8/SunflowerSwiftUI.xcframework.zip",
            checksum: "c50c981afc47d5240ee520355abd19e430c1b0764e06fd5d971827c03a0101e9"
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
