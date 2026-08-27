import CodeViewerKit
import Testing
@testable import CodeViewerKitStandardLanguages

@Test
@MainActor
func completeCatalogCanCreateAHighlightStore() {
    #expect(CodeViewerKitStandardLanguages.all.count == 38)
    _ = CodeHighlightStore(grammars: CodeViewerKitStandardLanguages.all)
}
