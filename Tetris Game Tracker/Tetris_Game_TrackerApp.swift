//
//  Tetris_Game_TrackerApp.swift
//  Tetris Game Tracker
//
//  Created by Jay Miller on 10/22/21.
//

import SwiftUI

@main
struct Tetris_Game_TrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
