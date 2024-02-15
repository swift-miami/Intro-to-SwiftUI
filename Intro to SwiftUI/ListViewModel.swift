//
//  ListViewModel.swift
//  Intro to SwiftUI
//
//  Created by Giovanni Noa on 2/7/24.
//

import Foundation

// Observable (property wrapper) replaces ObservableObject.
// Its intended use is to cause the UI to update every time
// your underlying data changes (ex. add/remove an item)
@Observable
final class ListViewModel {

    private(set) var listItems: [ListItem]

    init(listItems: [ListItem] = Server.listItems) {
        self.listItems = listItems
    }

    func sort(by type: SortType) {
        switch type {
        case .ascending: listItems = listItems.sorted(by: {$0.title < $1.title})
        case .descending: listItems = listItems.sorted(by: {$0.subtitle < $1.subtitle})
        }
    }

    func delete(item: ListItem) {
        listItems.removeAll(where: { $0.title == item.title })
    }
 }

enum SortType {
    case ascending
    case descending
}

struct ListItem: Identifiable {
    var id: Int {
        var hash = Hasher()

        hash.combine(title)
        hash.combine(subtitle)
        
        return hash.finalize()
    }
    let title: String
    let subtitle: String
}

extension ListViewModel {
    struct Server {
        static let listItems = [
            ListItem(title: "Apple Inc", subtitle: "Cupertino"),
            ListItem(title: "Chewy", subtitle: "Plantation"),
            ListItem(title: "Plei", subtitle: "Brickell")
        ]
    }
}
