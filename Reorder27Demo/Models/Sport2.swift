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

@Model
class Sport2 {
    var name: String
    var colorEnum: SportColor
    var sortOrder: Int
    var color: Color {
        colorEnum.color
    }
    var isFavourite: Bool
    
    init(name: String, color: SportColor, isFavourite: Bool = false,  sortOrder: Int) {
        self.name = name
        self.colorEnum = color
        self.isFavourite = isFavourite
        self.sortOrder = sortOrder
    }
    
    enum SportColor: String, Codable {
        case red, blue, indigo, green, orange, brown, cyan
        var color: Color {
            switch self {
            case .red:
                    .red
            case .blue:
                    .blue
            case .indigo:
                    .indigo
            case .green:
                    .green
            case .orange:
                    .orange
            case .brown:
                    .brown
            case .cyan:
                    .cyan
            }
        }
    }
    
    static var samples: [Sport2] {
        [
            .init(name: "Basketball", color: .red, isFavourite: true, sortOrder: 0),
            .init(name: "Hockey", color: .blue, sortOrder: 1),
            .init(name: "Tennis", color: .green, isFavourite: true, sortOrder: 2),
            .init(name: "Baseball", color: .indigo, sortOrder: 3),
            .init(name: "Soccer", color: .orange, sortOrder: 4),
            .init(name: "Football", color: .brown, isFavourite: true, sortOrder: 5),
            .init(name: "Golf", color: .cyan, isFavourite: true, sortOrder: 6)
        ]
    }
    
    static func reorder(_ difference: ReorderDifference<PersistentIdentifier, ReorderableSingleCollectionIdentifier>, for sports: [Sport2], in modelContext: ModelContext) {
        guard let sourceID = difference.sources.first, let sourceIndex = sports.firstIndex(where: {$0.id == sourceID}) else { return }
        var reorderedSports = sports
        let sourceSport = reorderedSports.remove(at: sourceIndex)
        switch difference.destination.position {
        case .before(let destinationID):
            guard let desinationIndex = reorderedSports.firstIndex(where: {$0.id == destinationID}) else { return}
            reorderedSports.insert(sourceSport, at: desinationIndex)
        case .end:
            reorderedSports.append(sourceSport)
        }
        for (index, sport) in reorderedSports.enumerated() {
            sport.sortOrder = index
        }
        try? modelContext.save()
        
    }
    
}
