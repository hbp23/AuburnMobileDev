//
//  FruitInfoApp.swift
//  FruitInfo
//
//  Created by Harsh Patel on 11/11/25.
//

import SwiftUI

@main
struct FruitInfoApp: App {
    
    @StateObject var fruits = FruitsViewModel()
    @AppStorage("hasSeenIntro") var hasSeenIntro: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if hasSeenIntro {
                ContentView()
                    .environmentObject(fruits)
            } else {
                IntroView {
                    hasSeenIntro = true
                }
                    .environmentObject(fruits)
            }
        }
    }
}
