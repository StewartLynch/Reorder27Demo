//
//----------------------------------------------
// Original project: Reorder27Demo
//
// Follow me on Mastodon: https://iosdev.space/@StewartLynch
// Follow me on Threads: https://www.threads.net/@stewartlynch
// Follow me on Bluesky: https://bsky.app/profile/stewartlynch.bsky.social
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Email: slynch@createchsol.com
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch
//----------------------------------------------
// Copyright © 2026 CreaTECH Solutions (Stewart Lynch). All rights reserved.


import SwiftUI

struct SectionedReorder: View {
    @State private var sections = SportSection.sections
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(sections) { section in
                    Section(section.name) {
                        ForEach(section.sports) { sport in
                            Text(sport.name)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(.white)
                                .padding()
                                .background(sport.color, in: .rect(cornerRadius: 10))
                        }
                        .listRowSeparator(.hidden)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Favourite Sports")
        }
    }
}

#Preview {
    SectionedReorder()
}
