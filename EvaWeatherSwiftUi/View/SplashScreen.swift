//
//  ContentView.swift
//  EvaWeatherSwiftUi
//
//  Created by raneem on 21/07/2024.
//

import SwiftUI
import CoreData

struct SplashScreen: View {
    @State private var isActive = false
    @State private var logoScale: CGFloat = 0.5
    @State private var logoOpacity: Double = 0.0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.brown.opacity(0.29)
                    .ignoresSafeArea()
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(logoScale)
                    .opacity(logoOpacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.5)) {
                            logoScale = 1.0
                            logoOpacity = 1.0
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            isActive = true
                        }
                    }
            }
            .navigationDestination(isPresented: $isActive) {
                CitiesScreen()
            }
        }
    }
}


#Preview {
    SplashScreen().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
