//
//  IntroView.swift
//  FruitInfo
//
//  Created by Harsh Patel on 11/11/25.
//

import SwiftUI

struct IntroView: View {
    
    @EnvironmentObject var fruits : FruitsViewModel
    var onFinish : () -> Void = {}
    
    var body: some View {
        VStack {
            TabView {
                ForEach(fruits.introPages) { page in
                    VStack(spacing: 10) {
                        Spacer()
                        
                        Image(page.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 500)
                        
                        Text(page.caption)
                            .fontWeight(.bold)
                            .font(.title3)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        
                        Spacer()
                    }
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .padding()
            
            Button(action: {
                onFinish()
            }) {
                Text("Start Exploring")
                    .font(.headline)
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(Color.blue)
                    .foregroundStyle(.white)
                
            }
            .padding(.horizontal)
            .padding(.bottom, 40)
        }
        .ignoresSafeArea(.all)
        .onAppear {
            fruits.loadIntroPages()
        }
    }
}

#Preview {
    IntroView()
        .environmentObject(FruitsViewModel())
}
