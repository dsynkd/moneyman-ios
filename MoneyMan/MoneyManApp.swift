//
//  MoneyManApp.swift
//  MoneyMan
//
//  Created by Darren Sadr on 4/17/22.
//

import SwiftUI

@main
struct MoneyManApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
