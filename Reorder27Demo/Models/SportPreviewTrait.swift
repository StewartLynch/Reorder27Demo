//
//----------------------------------------------
// Original project: Reorder27Demo
// by  Stewart Lynch on 2026-08-14
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch
//----------------------------------------------
// Copyright © 2026 CreaTECH Solutions. All rights reserved.



import SwiftData
import SwiftUI

struct SportPreviewTrait: PreviewModifier {
    func body(content: Content, context: ModelContainer) -> some View {
        content.modelContainer(context)
    }
    
    static func makeSharedContext() async throws -> ModelContainer {
        let container = try ModelContainer(
            for: Sport2.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        Sport2.samples.forEach { container.mainContext.insert($0) }
        try? container.mainContext.save()
        return container
    }
}

extension PreviewTrait where T == Preview.ViewTraits {
    static var sportSamples: Self = .modifier(SportPreviewTrait())
}
