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
                        .reorderable(collectionID: section.id)
                        .listRowSeparator(.hidden)
                    }
                }
            }
            .reorderContainer(for: Sport.self, in: SportSection.Rating.self){ difference in
                let destinationSectionId = difference.destination.collectionID
                guard let destinationSectionIndex = sections.firstIndex(where: {$0.id == destinationSectionId}) else { return }
                let movedSportIDs = Set(difference.sources)
                var updatedSections = sections
                var movedSports: [Sport] = []
                
                for index in updatedSections.indices {
                    updatedSections[index].sports.removeAll { sport in
                        guard movedSportIDs.contains(sport.id) else { return false }
                        movedSports.append(sport)
                        return true
                    }
                }
                
                guard !movedSports.isEmpty else {
                    return
                }
                
                for index in movedSports.indices {
                    movedSports[index].isFavourite = destinationSectionId == .favourite
                }
                
                switch difference.destination.position {
                case .before(let destinationID):
                    guard let insertionIndex = updatedSections[destinationSectionIndex].sports.firstIndex(where: {$0.id == destinationID}) else { return }
                    updatedSections[destinationSectionIndex].sports.insert(contentsOf: movedSports, at: insertionIndex)
                case .end:
                    updatedSections[destinationSectionIndex].sports.append(contentsOf: movedSports)
                }
                sections = updatedSections
            }
            .listStyle(.plain)
            .navigationTitle("Favourite Sports")
        }
    }
}

#Preview {
    SectionedReorder()
}
