//
//  BooksView.swift
//  Favorites_Completed
//
//  Created by Harsh Patel on 11/2/25.
//

import SwiftUI

struct BooksView: View {
    
    @EnvironmentObject var favorites: FavoritesViewModel
    @Binding var searchText: String
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(favorites.filteredBooks(searchText: searchText)) { book in
                    BookRowView(book: book)
                }
            }
            .padding()
        }
    }
}
