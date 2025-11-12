//
//  FruitsViewModel.swift
//  FruitInfo
//
//  Created by Harsh Patel on 11/11/25.
//

import Foundation
import Combine

class FruitsViewModel : ObservableObject {
    @Published var introPages : [IntroPage] = []
    @Published var familyfruits : [FruitModel] = []
    @Published var isLoading = false
    @Published var hasError = false
    @Published var fruitError : FruitModelError?
    
    func loadIntroPages() {
        guard introPages.isEmpty else { return }
        
        let captions = ["Discover fruit families",
                        "Browse individual fruits",
                        "View nutrition facts",
                        "Learn botanical details"]
        let randomImages = (1...6)
            .map { String($0) }
            .shuffled()
            .prefix(4)
        
        introPages = zip(randomImages, captions).map {
            IntroPage(imageName: $0, caption: $1)
        }
        
    }
    
    @MainActor
    func fetchFruits(family: String) async {
        self.isLoading = true
        self.familyfruits.removeAll()
        let baseUrl = "https://www.fruityvice.com/api/fruit/family/"
        let encoded = family.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? family
        guard let url = URL(string: baseUrl + encoded) else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode([FruitModel].self, from: data)
            
            self.familyfruits = response
            self.isLoading = false
        } catch {
            self.hasError = true
            self.fruitError = .customError(error: error)
            self.isLoading = false
        }
        
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard error == nil else {
//                print("Error \(error!)")
//                return
//            }
//            
//            guard let data = data else {
//                print("No data returned")
//                return
//            }
//            
//            do {
//                let response = try JSONDecoder().decode([FruitModel].self, from: data)
//                
//                DispatchQueue.main.async {
//                    self.familyfruits = response
//                    self.isLoading = false
//                }
//            } catch {
//                print("Decoding error: \(error)")
//            }
//        }.resume()
    }
    
    enum FruitModelError : LocalizedError {
        case decodingError
        case customError(error: Error)
        
        var errorDescription: String? {
            switch self {
            case .decodingError:
                return "Failed to decode fruit data."
            case .customError(error: let error):
                return error.localizedDescription
            }
        }
    }
    
}
