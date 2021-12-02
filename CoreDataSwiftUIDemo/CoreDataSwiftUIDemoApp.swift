//
//  CoreDataSwiftUIDemoApp.swift
//  CoreDataSwiftUIDemo
//
//  Created by Minhaz on 02/12/21.
//

import SwiftUI

@main
struct CoreDataSwiftUIDemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
