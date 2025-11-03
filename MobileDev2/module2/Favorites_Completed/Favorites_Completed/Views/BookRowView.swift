//
//  BookRowView.swift
//  Favorites_Completed
//
//  Created by Harsh Patel on 11/2/25.
//

import SwiftUI

struct BookRowView: View {
    
    let book: BookModel
    @EnvironmentObject private var favorites: FavoritesViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Label("\(book.bookTitle)", systemImage: "book")
                    .font(.headline)
                Label("\(book.bookAuthor)", systemImage: "person")
                    .font(.subheadline)
            }
            
            Spacer()
            
            Button(action: {
                favorites.toggleFavoriteBook(book: book)
            }) {
                Image(systemName: book.isFavorite ? "heart.fill" : "heart")
                    .foregroundStyle(book.isFavorite ? .red : .gray)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    BookRowView(book: BookModel(id: 1, bookTitle: "Hello World", bookAuthor: "Harsh Patel"))
}
