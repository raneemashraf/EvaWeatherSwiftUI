//
//  EvaWeatherSwiftUiApp.swift
//  EvaWeatherSwiftUi
//
//  Created by raneem on 21/07/2024.
//

import SwiftUI

@main
struct EvaWeatherSwiftUiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
