# CodeViewerKitStandardLanguages

`CodeViewerKitStandardLanguages` is the one-import language catalog for
[CodeViewerKit](https://github.com/cavs1910/CodeViewerKit). It registers every
parser and highlight query currently published by
[TreeSitterLanguages](https://github.com/simonbs/TreeSitterLanguages).

## Installation

Add this package to the app target and select the
`CodeViewerKitStandardLanguages` product. The package already brings
`CodeViewerKit` and all parser/query products transitively.

```swift
import CodeViewerKit
import CodeViewerKitStandardLanguages

@State private var highlightStore = CodeHighlightStore(
    grammars: CodeViewerKitStandardLanguages.all
)
```

You can also register an individual grammar:

```swift
let store = CodeHighlightStore(
    grammars: [CodeViewerKitStandardLanguages.swift]
)
```

The catalog contains Astro, Bash, C, C#, C++, CSS, Comment, Elixir, Elm, Go,
Haskell, HTML, Java, JavaScript, JSDoc, JSON, JSON5, Julia, LaTeX, Lua,
Markdown, Markdown Inline, OCaml, Perl, PHP, Python, R, Regex, Ruby, Rust,
SCSS, SQL, Svelte, Swift, TOML, TSX, TypeScript, and YAML.

## Size and updates

Using `all` intentionally links every native parser and its query resources.
For a small app, direct language products remain the lighter option.

The catalog is pinned to TreeSitterLanguages 0.1.10. SwiftPM dependencies and
module imports are resolved at build time, so a newly published community
grammar becomes available after this wrapper publishes a version that includes
it. No parser executable code is downloaded at runtime.

## License

CodeViewerKitStandardLanguages is available under the Apache License 2.0.
TreeSitterLanguages is available under the MIT License; individual grammar
repositories may carry their own notices.
