import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let basePath = "Targets/UIKitToSwiftUI"
let bundleId = "io.tuist.ProjectDescriptionHelpers"

let project = Project(
        name: "UIKitToSwiftUI",
        packages: [ ],
        targets: [
            Target(name: "UIKitToSwiftUI",
                   platform: .iOS,
                   product: .app,
                   bundleId: bundleId,
                   deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
                   sources: ["\(basePath)/Sources/**"],
                   dependencies: [ ]
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
        ]
)
