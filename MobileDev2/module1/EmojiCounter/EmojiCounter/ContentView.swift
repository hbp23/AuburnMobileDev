//
//  ContentView.swift
//  EmojiCounter
//
//  Created by Harsh Patel on 10/26/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var items: [EmojiItem] = [
        .init(symbol: "🤣"),
        .init(symbol: "🥺"),
        .init(symbol: "🥸"),
        .init(symbol: "😘"),
        .init(symbol: "🥹"),
        .init(symbol: "😜"),
        .init(symbol: "🙂"),
        .init(symbol: "🤩"),
        .init(symbol: "😂")
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($items) { $item in ListItem(emojiName: item.symbol, emojiCount: $item.count)
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle(Text("Emoji Counter"))
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct EmojiItem: Identifiable {
    var id = UUID()
    var symbol: String
    var count: Int = 0
}

struct ListItem: View {
    @Environment(\.colorScheme) var colorScheme
    var emojiName : String
    @Binding var emojiCount : Int
    
    var body: some View {
        HStack {
            Text(emojiName)
                .font(.title2)
            Text("Counter: \(emojiCount)")
                .font(.title2)
            Spacer()
            HStack {
                Button {
                    emojiCount += 1
                }
                label: {
                    Image(systemName: "plus.circle")
                }
                Button {
                    emojiCount -= 1
                }
                label: {
                    Image(systemName: "minus.circle")
                }
            }
            .buttonStyle(.bordered)
            .tint(colorScheme == .dark ? .yellow : .red)
        }
        .padding()
        .foregroundStyle(colorScheme == .dark ? .yellow : .red)
    }
}


#Preview {
    ContentView()
        .preferredColorScheme(.light)
}
#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
