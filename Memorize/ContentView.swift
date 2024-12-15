//
//  ContentView.swift
//  Memorize
//
//  Created by 张超 on 2024/12/10.
//

import SwiftUI

struct ContentView: View {
    @State var emojis: [String] = ["😈", "👹", "👺", "🤡", "💩", "👻", "💀", "☠️"]
    @State var cardCount = 4
    var body: some View {
        VStack {
            cards
            buttons
        }
    }

    var buttons: some View {
        HStack {
            Button(action: {
                handleCardCount(by: 1)
            }) {
                Label("Add Cards", systemImage: "plus.square.fill.on.square.fill")
                    .labelStyle(.titleAndIcon)
            }.disabled(cardCount == emojis.count)
            Spacer()

            Button(action: {
                handleCardCount(by: -1)
            }) {
                Label("Remove Cards", systemImage: "minus.square.fill")
                    .labelStyle(.titleAndIcon)
            }.disabled(cardCount == 1)
        }
        .padding()
    }

    func handleCardCount(by offset: Int) {
        let newCount = cardCount + offset
        if newCount > 0 && newCount <= emojis.count {
            cardCount = newCount
        }
    }

    var cards: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80, maximum: 100))]) {
                ForEach(0 ..< cardCount, id: \.self) { index in
                    CardView(content: emojis[index])
                }
            }
            .padding()
        }
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .stroke(.orange, lineWidth: 2)
                .fill(isFaceUp ? .white : .orange)
                .aspectRatio(2 / 3, contentMode: .fit)
            Text(content)
                .font(.system(size: 50))
                .bold()
                .opacity(isFaceUp ? 1 : 0)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
