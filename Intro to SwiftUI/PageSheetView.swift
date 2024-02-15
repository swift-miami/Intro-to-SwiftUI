//
//  PageSheetView.swift
//  Intro to SwiftUI
//
//  Created by Giovanni Noa on 2/12/24.
//

import SwiftUI

struct PageSheetView: View {
    @State private var presented: Bool = false
    var body: some View {
        Button("Tap tap tap") {
            presented.toggle()
        }

        .sheet(isPresented: $presented) {
            VStack(alignment: .center, spacing: 0) {
//                HStack {
//                    Spacer()
//
//                    Button(action: { }) {
//                        Image(systemName: "x.circle.fill")
//                            .resizable()
//                            .frame(width: 26, height: 26)
//                            .foregroundStyle(.gray, Color(UIColor.systemGray3))
//                    }
//                    .frame(alignment: .trailing)
//                    .padding([.top, .trailing], 16)
//                }
//                .frame(alignment: .trailing)

                Image("applemusic")
                    .resizable()
                    .padding(.top, 32)

                VStack(alignment: .leading, spacing: 16) {
                    Text(" Music")
                        .font(.title3)

                    Text("Get 2 months free to explore what's new since you left.")
                        .font(.largeTitle)
                        .bold()

                    Text("Plus, your entire music library on all your devices. 2 months free then $10.99 a month.")
                        .foregroundStyle(.secondary)
                        .font(.body)

                    Button(action:{ }) {
                        Text("Try it Free")
                            .font(.headline)
                            .padding(.vertical, 16)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 16)

                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(
                            cornerSize: .init(width: 16, height: 16)
                        )
                        .fill(.red)
                    )
                    .padding(.bottom, 16)
                }
                .padding()
                .padding(.horizontal, 8)
            }
            .toolbar {
                Button(action: { }) {
                    Image(systemName: "x.circle.fill")
                        .resizable()
                        .frame(width: 26, height: 26)
                        .foregroundStyle(.gray, Color(UIColor.systemGray3))
                }
            }
        }
    }
}

#Preview {
    PageSheetView()
}
