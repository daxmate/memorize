//
//  ContentView.swift
//  Memorize
//
//  Created by 张超 on 2024/12/10.
//

import SwiftUI

struct ContentView: View {
    @State var emojis: [String] = ["😈", "👹", "👺", "🤡", "💩", "👻", "💀"]
    var body: some View {
        VStack {
            cards
            Button(action: {
                // 示例功能：在点击时添加一个新卡片
                emojis.append("🎃")
            }) {
                Label("Add Cards", systemImage: "plus.square.fill.on.square.fill")
                    .labelStyle(.titleAndIcon)
            }
            .padding()
        }
    }

    var cards: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80, maximum: 100))]) {
                ForEach(emojis, id: \.self) { emoji in
                    CardView(content: emoji)
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
