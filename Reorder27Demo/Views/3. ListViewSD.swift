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


import SwiftUI
import SwiftData

struct ListViewSD: View {
    @Query(sort: \Sport2.sortOrder) var sports: [Sport2]
    @Environment(\.modelContext) var modelContext
    var body: some View {
        NavigationStack {
            List {
                ForEach(sports) { sport in
                    LabeledContent {
                        Image(systemName: sport.isFavourite ? "checkmark.app" : "xmark.app")
                    } label: {
                        Text(sport.name)
                    }
                    .foregroundStyle(.white)
                    .padding()
                    .background(sport.color, in: .rect(cornerRadius: 10))
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("My Sports")
            .toolbar {
                if sports.isEmpty {
                    Button("Seed") {
                        Sport2.samples.forEach { sport in
                            modelContext.insert(sport)
                        }
                    }
                }
            }
        }
    }
}

#Preview(traits: .sportSamples) {
    ListViewSD()
}
