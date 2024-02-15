//
//  ContentView.swift
//  Intro to SwiftUI
//
//  Created by Giovanni Noa on 2/7/24.
//
import Combine
import SwiftUI

struct MainView: View {
    @State private var backgroundColor: Color = .primary
    
    var body: some View {
        List {
            NavigationLink(destination: {
                ListView()
            }, label: {
                Label("List View", systemImage:"checkmark.circle")
            })

            NavigationLink("Dialog View ☑️") {
                ConfirmChangeColorView(backgroundColor: $backgroundColor)
                    .background(backgroundColor)
            }

            NavigationLink("Page Sheet 📄") {
                PageSheetView()
            }
        }
        .navigationTitle("Intro to SwiftUI")
    }
}

#Preview {
    NavigationView {
        MainView()
    }
}
