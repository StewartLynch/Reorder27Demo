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

struct StartTab: View {
    var body: some View {
        TabView {
            Tab {
                ListView()
            } label: {
                Image(systemName: "1.circle")
            }
            Tab {
                GridView()
            } label: {
                Image(systemName: "2.circle")
            }
            Tab {
                ListViewSD()
            } label: {
                Image(systemName: "3.circle.fill")
            }
            Tab {
                SectionedReorder()
            } label: {
                Image(systemName: "4.circle.fill")
            }
            
        }
    }
}

#Preview(traits: .sportSamples) {
    StartTab()
}
