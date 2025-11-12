//
//  ContentView.swift
//  FruitInfo
//
//  Created by Harsh Patel on 11/11/25.
//

import SwiftUI

struct ContentView: View {
    
    let fruitFamilies : [String] = [
        "Actinidiaceae" ,"Anacardiaceae" ,"Annonaceae" ,"Betulaceae",
        "Bromeliaceae" ,"Cactaceae" ,"Caricaceae" ,"Clusiaceae",
        "Cucurbitaceae" ,"Ebenaceae" ,"Ericaceae" ,"Grossulariaceae",
        "Lauraceae" ,"Lythraceae" ,"Malvaceae" ,"Moraceae" ,"Musaceae",
        "Myrtaceae" ,"Passifloraceae" ,"Rosaceae" ,"Rutaceae" ,"Salicaceae",
        "Sapindaceae" ,"Solanaceae" ,"Vitaceae"
    ]
    
    @State var selectedFamily = "Actinidiaceae"
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                Picker("Select a Fruit Family", selection: $selectedFamily) {
                    ForEach(fruitFamilies, id: \.self) { family in
                        Text(family).tag(family)
                    }
                }
                .pickerStyle(.automatic)
                .frame(height: 150)
                .padding(.horizontal)
                
                NavigationLink(destination: FruitGridView(family: selectedFamily)) {
                    Text("Search")
                        .font(.headline)
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        
                }
            }
            .navigationTitle("Discover Fruit Families")
        }
    }
}

#Preview {
    ContentView()
}
