import CodeViewerKit
import Testing
@testable import CodeViewerKitStandardLanguages

@Test
@MainActor
func completeCatalogCanCreateAHighlightStore() {
    let grammars = CodeViewerKitStandardLanguages.all
    let identifiers = grammars.map(\.identifier)

    #expect(grammars.count == 38)
    #expect(Set(identifiers).count == grammars.count)
    #expect(identifiers.contains("swift"))
    #expect(
        grammars.first { $0.identifier == "typescript" }?.aliases
            .contains("ts") == true
    )
    _ = CodeHighlightStore(grammars: grammars)
}
