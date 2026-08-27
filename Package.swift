// swift-tools-version: 6.0

import PackageDescription

let languages = [
    "Astro", "Bash", "C", "Comment", "CSharp", "CPP", "CSS", "Elixir",
    "Elm", "Go", "Haskell", "HTML", "Java", "JavaScript", "JSDoc",
    "JSON", "JSON5", "Julia", "LaTeX", "Lua", "Markdown",
    "MarkdownInline", "OCaml", "Perl", "PHP", "Python", "R", "Regex",
    "Ruby", "Rust", "SCSS", "SQL", "Svelte", "Swift", "TOML", "TSX",
    "TypeScript", "YAML"
]

let languageDependencies: [Target.Dependency] = languages.flatMap { language in
    [
        .product(
            name: "TreeSitter\(language)",
            package: "TreeSitterLanguages"
        ),
        .product(
            name: "TreeSitter\(language)Queries",
            package: "TreeSitterLanguages"
        )
    ]
}

let package = Package(
    name: "CodeViewerKitStandardLanguages",
    platforms: [
        .iOS(.v18),
        .macOS(.v15)
    ],
    products: [
        .library(
            name: "CodeViewerKitStandardLanguages",
            targets: ["CodeViewerKitStandardLanguages"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/cavs1910/CodeViewerKit.git",
            from: "0.6.2"
        ),
        .package(
            url: "https://github.com/simonbs/TreeSitterLanguages.git",
            exact: "0.1.10"
        )
    ],
    targets: [
        .target(
            name: "CodeViewerKitStandardLanguages",
            dependencies: [
                .product(name: "CodeViewerKit", package: "CodeViewerKit")
            ] + languageDependencies
        ),
        .testTarget(
            name: "CodeViewerKitStandardLanguagesTests",
            dependencies: ["CodeViewerKitStandardLanguages"]
        )
    ]
)
