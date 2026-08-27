import CodeViewerKit
import SwiftUI

@main
struct CodeViewerExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            CodeViewerCommands()
        }
    }
}
