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

struct ListView: View {
    @State private var sports = Sport.samples
    var body: some View {
        NavigationStack {
            List {
                ForEach(sports) { sport in
                    SportRow(sport: sport)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("My Sports")
        }
    }
}


#Preview {
    ListView()
}


struct SportRow: View {
  let sport: Sport
  var body: some View {
    LabeledContent {
        Image(systemName: sport.isFavourite ? "checkmark.app" : "xmark.app")
    } label: {
      Text(sport.name)
    }
    .foregroundStyle(.white)
    .padding()
    .background(sport.color, in: .rect(cornerRadius: 10))
  }
}

