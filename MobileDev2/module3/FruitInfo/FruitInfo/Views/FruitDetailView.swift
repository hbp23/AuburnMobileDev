//
//  FruitDetailView.swift
//  FruitInfo
//
//  Created by Harsh Patel on 11/12/25.
//

import SwiftUI

struct FruitDetailView: View {
    
    var fruit : FruitModel
    
    var imageURL: URL? {
            URL(string: "https://tse1.mm.bing.net/th?q=\(fruit.name)+fruit")
        }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                AsyncImage(url: imageURL) { phase in
                    if let img = phase.image {
                        img.resizable().scaledToFill()
                    } else {
                        Color.gray.opacity(0.2)
                    }
                }
                .frame(height: 240)
                .clipped()
                .cornerRadius(12)
                .padding(.horizontal)

                VStack(alignment: .leading, spacing: 6) {
                    Text(fruit.name)
                        .font(.largeTitle).bold()

                    Label(fruit.family, systemImage: "leaf")
                    Label(fruit.order, systemImage: "arrowshape.turn.up.right")
                    Label(fruit.genus, systemImage: "circle.hexagonpath")
                }
                .font(.title3)
                .padding(.horizontal)

                VStack(alignment: .leading, spacing: 12) {
                    Text("Nutrition (per 100g)")
                        .font(.headline)

                    HStack { Label("Calories", systemImage: "flame"); Spacer(); Text("\(fruit.nutritions.calories, specifier: "%.0f")") }
                    HStack { Label("Fat", systemImage: "drop"); Spacer(); Text("\(fruit.nutritions.fat, specifier: "%.1f")g") }
                    HStack { Label("Sugar", systemImage: "cube"); Spacer(); Text("\(fruit.nutritions.sugar, specifier: "%.1f")g") }
                    HStack { Label("Carbs", systemImage: "fork.knife"); Spacer(); Text("\(fruit.nutritions.carbohydrates, specifier: "%.1f")g") }
                    HStack { Label("Protein", systemImage: "dumbbell"); Spacer(); Text("\(fruit.nutritions.protein, specifier: "%.1f")g") }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal)

                Spacer()
            }
            .padding(.top)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    FruitDetailView(fruit: FruitModel(
        id : 66,
        name : "Kiwi",
        family : "Actinidiaceae",
        order : "Struthioniformes",
        genus : "Apteryx",
        nutritions: Nutritions(
            calories : 61,
            fat : 0.5,
            sugar : 9,
            carbohydrates : 15,
            protein : 1.1
        )
    ))
}
