//
//  FruitGridView.swift
//  FruitInfo
//
//  Created by Harsh Patel on 11/11/25.
//

import SwiftUI

struct FruitGridView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    var family : String
    @EnvironmentObject var fruits : FruitsViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            if fruits.isLoading {
                ProgressView("Fruits Loading...")
                    .padding()
            } else {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(fruits.familyfruits) { fruit in
                        NavigationLink(destination: FruitDetailView(fruit: fruit)) {
                            VStack(alignment: .leading, spacing: 10) {
                                AsyncImage(url: URL(string: "https://tse1.mm.bing.net/th?q=\(fruit.name)+fruit")) { phase in
                                    
                                    switch phase {
                                    case .empty:
                                        ZStack {
                                            Rectangle()
                                                .fill(Color.gray.opacity(0.2))
                                                .frame(maxWidth: .infinity)
                                                .aspectRatio(1.4, contentMode: .fill)
                                            ProgressView()
                                        }
                                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                                        
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .aspectRatio(1.4, contentMode: .fill)
                                            .frame(maxWidth: .infinity)
                                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                                        
                                    case .failure:
                                        Color.gray
                                            .aspectRatio(1.4, contentMode: .fill)
                                            .frame(maxWidth: .infinity)
                                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                                        
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                                
                                Text(fruit.name)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                                    .lineLimit(2)
                                    .multilineTextAlignment(.leading)
                            }
                            .padding()
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        }
                    }
                }
                .padding()
            }
        }
        .task {
            await fruits.fetchFruits(family: family)
        }
        .alert(isPresented: $fruits.hasError, error: fruits.fruitError) { _ in
            Button("Ok", role: .cancel) { }
        } message: { error in
            Text(error.localizedDescription)
        }
    }
    
}

#Preview {
    FruitGridView(family: "Actinidiaceae")
        .environmentObject(FruitsViewModel())
}
