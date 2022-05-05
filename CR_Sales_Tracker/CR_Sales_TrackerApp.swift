//
//  CR_Sales_TrackerApp.swift
//  CR_Sales_Tracker
//
//  Created by Rubes on 5/5/22.
//

import SwiftUI

@main
struct CR_Sales_TrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
