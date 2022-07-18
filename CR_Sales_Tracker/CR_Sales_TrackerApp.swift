//
//  CR_Sales_TrackerApp.swift
//  CR_Sales_Tracker
//
//  Created by Rubes on 5/5/22.
//

import SwiftUI
import Firebase

@main
struct CR_Sales_TrackerApp: App {
    init (){
        FirebaseApp.configure()
    }
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
