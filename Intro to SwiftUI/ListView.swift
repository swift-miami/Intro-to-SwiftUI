//
//  ListView.swift
//  Intro to SwiftUI
//
//  Created by Giovanni Noa on 2/7/24.
//

import SwiftUI

// SwiftUI List that displays rows of cell content.
struct ListView: View {
    @State var viewModel =  ListViewModel()

    var body: some View {
        GeneratedListView(listItems: viewModel.listItems) { item in
            viewModel.delete(item: item)
        }
            .navigationTitle("List View")
            .toolbar {
                Menu("Sort") { 
                    Button("Ascending") {
                        withAnimation {
                            viewModel.sort(by: .ascending)
                        }
                    }

                    Button("Descending") {
                        withAnimation {
                            viewModel.sort(by: .descending)
                        }

                    }
                }
            }
    }
}

struct GeneratedListView: View {
    var listItems: [ListItem]

    let buttonAction: ((ListItem) -> Void)?

    var body: some View {
        List(listItems) { item in
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)

                Text(item.subtitle)
                    .font(.subheadline)
            }
            .swipeActions(edge: .trailing) {
                Button("Delete", role: .destructive) {
                    buttonAction?(item)
                }
            }
        }
    }
}

// MARK: SwiftUI Preview
#Preview {
    ListView()
}
