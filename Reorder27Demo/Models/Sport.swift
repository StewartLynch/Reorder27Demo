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

struct Sport: Identifiable {
    let id = UUID()
    var name: String
    var color: Color
    var isFavourite = false
    
    static var samples: [Sport] {
        [
            .init(name: "Basketball", color: .red, isFavourite: true),
            .init(name: "Hockey", color: .blue),
            .init(name: "Tennis", color: .green, isFavourite: true),
            .init(name: "Baseball", color: .indigo),
            .init(name: "Soccer", color: .orange),
            .init(name: "Football", color: .brown, isFavourite: true),
            .init(name: "Golf", color: .cyan, isFavourite: true)
        ]
    }
    
    static func reorder(_ difference: ReorderDifference<UUID, ReorderableSingleCollectionIdentifier>, for sports: [Sport]) -> [Sport] {
        guard let sourceID = difference.sources.first,
              let sourceIndex = sports.firstIndex(where: {$0.id == sourceID}) else { return sports }
        var reorderedSports = sports
        let sourceSport = reorderedSports.remove(at: sourceIndex)
        switch difference.destination.position {
        case .before(let destinationID):
            guard let destinationIndex = reorderedSports.firstIndex(where: {$0.id == destinationID}) else { return sports  }
            reorderedSports.insert(sourceSport, at: destinationIndex)
        case .end:
            reorderedSports.append(sourceSport)
        }
       return reorderedSports
    }
}

struct SportSection: Identifiable {
    nonisolated enum Rating: String {
        case favourite = "Favourites"
        case other = "Other Sports"
    }
    let rating: Rating
    var sports: [Sport]
    var name: String {
        rating.rawValue
    }
    var id: Rating {
        rating
    }
    
    static var sections: [SportSection] {
        let sports = Sport.samples
        return [
            .init(
                rating: .favourite,
                sports: sports.filter(\.isFavourite)
            ),
            .init(
                rating: .other,
                sports: sports.filter { !$0.isFavourite }
            )
        ]
    }
}
