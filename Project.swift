import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

private let version: String = "0.0.1"
private let bundleId = "io.tuist.ProjectDescriptionHelpers"
private let bundleVersion: String = "1"
private let iOSTargetVersion: String = "16.0"
private let basePath = "Targets/UIKitToSwiftUI"
private let localPackagePath = "../Packages"

let project = Project(
        name: "UIKitToSwiftUI",
        packages: [
            .package(path: "\(localPackagePath)/MapkitToSwiftUI")
        ],
        targets: [
            Target(name: "UIKitToSwiftUI",
                   platform: .iOS,
                   product: .app,
                   bundleId: bundleId,
                   deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
                   infoPlist: makeInfoPlist(),
                   sources: ["\(basePath)/Sources/**"],
                   resources: ["\(basePath)/Resources/**"],
                   dependencies: [
                        .package(product: "MapkitToSwiftUI")
                   ]
                  ),
            Target(
                name: "UIKitToSwiftUITests",
                platform: .iOS,
                product: .unitTests,
                bundleId: "",
                dependencies: [
                    .target(name: "UIKitToSwiftUI")
                ]
            )
        ],
        additionalFiles: [
            "README.md"
        ]
)

private func makeInfoPlist(merging other: [String: Plist.Value] = [:]) -> InfoPlist {
    var extendedPlist: [String: Plist.Value] = [
        "UIApplicationSceneManifest": ["UIApplicationSupportsMultipleScenes": true],
        "UILaunchScreen": [],
        "UISupportedInterfaceOrientations":
            [
                "UIInterfaceOrientationPortrait"
            ],
        "CFBundleShortVersionString": "\(version)",
        "CFBundleVersion": "\(bundleVersion)",
        "CFBundleDisplayName": "$(APP_DISPLAY_NAME)"
    ]

    other.forEach { (key: String, value: Plist.Value) in
        extendedPlist[key] = value
    }

    return InfoPlist.extendingDefault(with: extendedPlist)
}
