import CodeViewerKit
import Foundation
import TreeSitterAstro
import TreeSitterAstroQueries
import TreeSitterBash
import TreeSitterBashQueries
import TreeSitterC
import TreeSitterCPP
import TreeSitterCPPQueries
import TreeSitterCQueries
import TreeSitterCSS
import TreeSitterCSSQueries
import TreeSitterCSharp
import TreeSitterCSharpQueries
import TreeSitterComment
import TreeSitterCommentQueries
import TreeSitterElixir
import TreeSitterElixirQueries
import TreeSitterElm
import TreeSitterElmQueries
import TreeSitterGo
import TreeSitterGoQueries
import TreeSitterHTML
import TreeSitterHTMLQueries
import TreeSitterHaskell
import TreeSitterHaskellQueries
import TreeSitterJSDoc
import TreeSitterJSDocQueries
import TreeSitterJSON
import TreeSitterJSON5
import TreeSitterJSON5Queries
import TreeSitterJSONQueries
import TreeSitterJava
import TreeSitterJavaQueries
import TreeSitterJavaScript
import TreeSitterJavaScriptQueries
import TreeSitterJulia
import TreeSitterJuliaQueries
import TreeSitterLaTeX
import TreeSitterLaTeXQueries
import TreeSitterLua
import TreeSitterLuaQueries
import TreeSitterMarkdown
import TreeSitterMarkdownInline
import TreeSitterMarkdownInlineQueries
import TreeSitterMarkdownQueries
import TreeSitterOCaml
import TreeSitterOCamlQueries
import TreeSitterPHP
import TreeSitterPHPQueries
import TreeSitterPerl
import TreeSitterPerlQueries
import TreeSitterPython
import TreeSitterPythonQueries
import TreeSitterR
import TreeSitterRQueries
import TreeSitterRegex
import TreeSitterRegexQueries
import TreeSitterRuby
import TreeSitterRubyQueries
import TreeSitterRust
import TreeSitterRustQueries
import TreeSitterSCSS
import TreeSitterSCSSQueries
import TreeSitterSQL
import TreeSitterSQLQueries
import TreeSitterSvelte
import TreeSitterSvelteQueries
import TreeSitterSwift
import TreeSitterSwiftQueries
import TreeSitterTOML
import TreeSitterTOMLQueries
import TreeSitterTSX
import TreeSitterTSXQueries
import TreeSitterTypeScript
import TreeSitterTypeScriptQueries
import TreeSitterYAML
import TreeSitterYAMLQueries

/// The complete grammar catalog distributed by TreeSitterLanguages 0.1.10.
///
/// Add this package when convenience is more important than binary size. Apps
/// that support only a few languages should link those grammar products and
/// register their own `CodeGrammar` values instead.
public enum CodeViewerKitStandardLanguages {
    public static let astro = grammar(
        "astro",
        language: tree_sitter_astro(),
        query: TreeSitterAstroQueries.Query.highlightsFileURL
    )

    public static let bash = grammar(
        "bash",
        aliases: ["sh", "shell", "zsh"],
        language: tree_sitter_bash(),
        query: TreeSitterBashQueries.Query.highlightsFileURL
    )

    public static let c = grammar(
        "c",
        aliases: ["h"],
        language: tree_sitter_c(),
        query: TreeSitterCQueries.Query.highlightsFileURL
    )

    public static let comment = grammar(
        "comment",
        language: tree_sitter_comment(),
        query: TreeSitterCommentQueries.Query.highlightsFileURL
    )

    public static let cSharp = grammar(
        "csharp",
        aliases: ["c-sharp", "cs"],
        language: tree_sitter_c_sharp(),
        query: TreeSitterCSharpQueries.Query.highlightsFileURL
    )

    public static let cpp = CodeGrammar(
        identifier: "cpp",
        aliases: ["c++", "cc", "cxx", "hpp", "hxx"],
        language: tree_sitter_cpp(),
        queryURLs: [
            TreeSitterCQueries.Query.highlightsFileURL,
            TreeSitterCPPQueries.Query.highlightsFileURL
        ]
    )

    public static let css = grammar(
        "css",
        language: tree_sitter_css(),
        query: TreeSitterCSSQueries.Query.highlightsFileURL
    )

    public static let elixir = grammar(
        "elixir",
        aliases: ["ex", "exs"],
        language: tree_sitter_elixir(),
        query: TreeSitterElixirQueries.Query.highlightsFileURL
    )

    public static let elm = grammar(
        "elm",
        language: tree_sitter_elm(),
        query: TreeSitterElmQueries.Query.highlightsFileURL
    )

    public static let go = grammar(
        "go",
        language: tree_sitter_go(),
        query: TreeSitterGoQueries.Query.highlightsFileURL
    )

    public static let haskell = grammar(
        "haskell",
        aliases: ["hs"],
        language: tree_sitter_haskell(),
        query: TreeSitterHaskellQueries.Query.highlightsFileURL
    )

    public static let html = grammar(
        "html",
        aliases: ["htm"],
        language: tree_sitter_html(),
        query: TreeSitterHTMLQueries.Query.highlightsFileURL
    )

    public static let java = grammar(
        "java",
        language: tree_sitter_java(),
        query: TreeSitterJavaQueries.Query.highlightsFileURL
    )

    public static let javaScript = grammar(
        "javascript",
        aliases: ["js", "jsx", "mjs", "cjs"],
        language: tree_sitter_javascript(),
        query: TreeSitterJavaScriptQueries.Query.highlightsFileURL,
        detectsSource: {
            $0.contains("console.log(") || $0.contains("=>")
        }
    )

    public static let jsDoc = grammar(
        "jsdoc",
        language: tree_sitter_jsdoc(),
        query: TreeSitterJSDocQueries.Query.highlightsFileURL
    )

    public static let json = grammar(
        "json",
        language: tree_sitter_json(),
        query: TreeSitterJSONQueries.Query.highlightsFileURL,
        detectsSource: { source in
            let trimmed = source.trimmingCharacters(in: .whitespacesAndNewlines)
            guard trimmed.hasPrefix("{") || trimmed.hasPrefix("[") else {
                return false
            }
            return (try? JSONSerialization.jsonObject(
                with: Data(trimmed.utf8)
            )) != nil
        }
    )

    public static let json5 = grammar(
        "json5",
        language: tree_sitter_json5(),
        query: TreeSitterJSON5Queries.Query.highlightsFileURL
    )

    public static let julia = grammar(
        "julia",
        aliases: ["jl"],
        language: tree_sitter_julia(),
        query: TreeSitterJuliaQueries.Query.highlightsFileURL
    )

    public static let latex = grammar(
        "latex",
        aliases: ["tex"],
        language: tree_sitter_latex(),
        query: TreeSitterLaTeXQueries.Query.highlightsFileURL
    )

    public static let lua = grammar(
        "lua",
        language: tree_sitter_lua(),
        query: TreeSitterLuaQueries.Query.highlightsFileURL
    )

    public static let markdown = grammar(
        "markdown",
        aliases: ["md", "mdown", "mkd"],
        language: tree_sitter_markdown(),
        query: TreeSitterMarkdownQueries.Query.highlightsFileURL
    )

    public static let markdownInline = grammar(
        "markdown-inline",
        aliases: ["md-inline"],
        language: tree_sitter_markdown_inline(),
        query: TreeSitterMarkdownInlineQueries.Query.highlightsFileURL
    )

    public static let ocaml = grammar(
        "ocaml",
        aliases: ["ml", "mli"],
        language: tree_sitter_ocaml(),
        query: TreeSitterOCamlQueries.Query.highlightsFileURL
    )

    public static let perl = grammar(
        "perl",
        aliases: ["pl", "pm"],
        language: tree_sitter_perl(),
        query: TreeSitterPerlQueries.Query.highlightsFileURL
    )

    public static let php = grammar(
        "php",
        language: tree_sitter_php(),
        query: TreeSitterPHPQueries.Query.highlightsFileURL
    )

    public static let python = grammar(
        "python",
        aliases: ["py", "pyw"],
        language: tree_sitter_python(),
        query: TreeSitterPythonQueries.Query.highlightsFileURL,
        detectsSource: {
            $0.contains("def ") || $0.lowercased().contains("python")
        }
    )

    public static let r = grammar(
        "r",
        language: tree_sitter_r(),
        query: TreeSitterRQueries.Query.highlightsFileURL
    )

    public static let regex = grammar(
        "regex",
        aliases: ["regexp"],
        language: tree_sitter_regex(),
        query: TreeSitterRegexQueries.Query.highlightsFileURL
    )

    public static let ruby = grammar(
        "ruby",
        aliases: ["rb"],
        language: tree_sitter_ruby(),
        query: TreeSitterRubyQueries.Query.highlightsFileURL
    )

    public static let rust = grammar(
        "rust",
        aliases: ["rs"],
        language: tree_sitter_rust(),
        query: TreeSitterRustQueries.Query.highlightsFileURL
    )

    public static let scss = grammar(
        "scss",
        language: tree_sitter_scss(),
        query: TreeSitterSCSSQueries.Query.highlightsFileURL
    )

    public static let sql = grammar(
        "sql",
        language: tree_sitter_sql(),
        query: TreeSitterSQLQueries.Query.highlightsFileURL
    )

    public static let svelte = grammar(
        "svelte",
        language: tree_sitter_svelte(),
        query: TreeSitterSvelteQueries.Query.highlightsFileURL
    )

    public static let swift = grammar(
        "swift",
        language: tree_sitter_swift(),
        query: TreeSitterSwiftQueries.Query.highlightsFileURL,
        detectsSource: {
            $0.contains("import SwiftUI") || $0.contains("import Foundation")
        }
    )

    public static let toml = grammar(
        "toml",
        language: tree_sitter_toml(),
        query: TreeSitterTOMLQueries.Query.highlightsFileURL
    )

    public static let tsx = CodeGrammar(
        identifier: "tsx",
        language: tree_sitter_tsx(),
        queryURLs: [
            TreeSitterJavaScriptQueries.Query.highlightsFileURL,
            TreeSitterJavaScriptQueries.Query.highlightsJSXFileURL,
            TreeSitterTSXQueries.Query.highlightsFileURL
        ]
    )

    public static let typeScript = CodeGrammar(
        identifier: "typescript",
        aliases: ["ts", "mts", "cts"],
        language: tree_sitter_typescript(),
        queryURLs: [
            TreeSitterJavaScriptQueries.Query.highlightsFileURL,
            TreeSitterTypeScriptQueries.Query.highlightsFileURL
        ],
        detectsSource: {
            $0.contains("interface ")
                || $0.contains(": string")
                || $0.contains(": number")
        }
    )

    public static let yaml = grammar(
        "yaml",
        aliases: ["yml"],
        language: tree_sitter_yaml(),
        query: TreeSitterYAMLQueries.Query.highlightsFileURL
    )

    /// Every grammar available in the pinned TreeSitterLanguages release.
    public static let all: [CodeGrammar] = [
        astro, bash, c, comment, cSharp, cpp, css, elixir, elm, go, haskell,
        html, java, javaScript, jsDoc, json, json5, julia, latex, lua,
        markdown, markdownInline, ocaml, perl, php, python, r, regex, ruby,
        rust, scss, sql, svelte, swift, toml, tsx, typeScript, yaml
    ]

    private static func grammar(
        _ identifier: String,
        aliases: [String] = [],
        language: OpaquePointer,
        query: URL,
        detectsSource: (@Sendable (String) -> Bool)? = nil
    ) -> CodeGrammar {
        CodeGrammar(
            identifier: identifier,
            aliases: aliases,
            language: language,
            queryURLs: [query],
            detectsSource: detectsSource
        )
    }
}
