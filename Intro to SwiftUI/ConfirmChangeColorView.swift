//
//  ConfirmChangeColorView.swift
//  Intro to SwiftUI
//
//  Created by Giovanni Noa on 2/12/24.
//

import SwiftUI

struct ConfirmChangeColorView: View {
    @State private var isShowingDialog = false
    @Binding var backgroundColor: Color
    
    var body: some View {
        VStack {
            Button("Change Background Color") {
                isShowingDialog = true
            }
            .confirmationDialog("", isPresented: $isShowingDialog) {
                Button("RGBification 🔴🟢🔵", role: .destructive) {
                    backgroundColor = Color(
                        red: .random(in: 0...1),
                        green: .random(in: 0...1),
                        blue: .random(in: 0...1)
                    )
                }
                
                Button("Cancel", role: .cancel) {
                    isShowingDialog = false
                }
            } message: {
                Text("Change Background Color!")
            }
        }
        // comment frame to show initial frame
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
