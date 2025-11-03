//
// FavoritesView.swift : Favorites
//
// Copyright © 2025 Auburn University.
// All Rights Reserved.


import SwiftUI


struct FavoritesView: View {
    @State private var searchText = ""
    @EnvironmentObject private var favorites: FavoritesViewModel

    var body: some View {
        NavigationStack {
            List {
                let cityMatches = favorites.favoritedCities.filter {
                    searchText.isEmpty || $0.cityName.localizedCaseInsensitiveContains(searchText)
                }
                if !cityMatches.isEmpty {
                    Section("Cities") {
                        ForEach(cityMatches) { city in
                            HStack {
                                Image(city.cityImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 30)
                                    .clipped()
                                Text(city.cityName)
                                Spacer()
                                Button { favorites.toggleFavoriteCity(city: city) } label: {
                                    Image(systemName: "heart.fill").imageScale(.large)
                                }.buttonStyle(.plain)
                            }
                        }
                    }
                }

                let hobbyMatches = favorites.favoritedHobbies.filter {
                    searchText.isEmpty || $0.hobbyName.localizedCaseInsensitiveContains(searchText)
                }
                if !hobbyMatches.isEmpty {
                    Section("Hobbies") {
                        ForEach(hobbyMatches) { hobby in
                            HStack {
                                Text(hobby.hobbyIcon)
                                    .font(.title2)
                                Text(hobby.hobbyName)
                                Spacer()
                                Button { favorites.toggleFavoriteHobby(hobby: hobby) } label: {
                                    Image(systemName: "heart.fill").imageScale(.large)
                                }.buttonStyle(.plain)
                            }
                        }
                    }
                }

                let bookMatches = favorites.favoritedBooks.filter {
                    searchText.isEmpty
                    || $0.bookTitle.localizedCaseInsensitiveContains(searchText)
                    || $0.bookAuthor.localizedCaseInsensitiveContains(searchText)
                }
                if !bookMatches.isEmpty {
                    Section("Books") {
                        ForEach(bookMatches) { book in
                            VStack(alignment: .leading, spacing: 2) {
                                Text(book.bookTitle).font(.headline)
                                Text(book.bookAuthor).font(.subheadline).foregroundStyle(.secondary)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .overlay(alignment: .trailing) {
                                Button { favorites.toggleFavoriteBook(book: book) } label: {
                                    Image(systemName: "heart.fill").imageScale(.large)
                                }.buttonStyle(.plain)
                            }
                        }
                    }
                }

                if cityMatches.isEmpty && hobbyMatches.isEmpty && bookMatches.isEmpty {
                    ContentUnavailableView(
                        "No Favorites",
                        systemImage: "star",
                        description: Text("Favorite cities, hobbies, or books to see them here.")
                    )
                }
            }
            .navigationTitle("Favorites")
            .searchable(text: $searchText, prompt: "Search Favorites")
        }
    }
}

#Preview {
    FavoritesView()
        .environmentObject(FavoritesViewModel())
}
