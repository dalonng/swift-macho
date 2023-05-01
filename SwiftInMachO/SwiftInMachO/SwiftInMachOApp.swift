//
//  SwiftInMachOApp.swift
//  SwiftInMachO
//
//  Created by d on 2023/05/01.
//

import SwiftUI

@main
struct SwiftInMachOApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LoadCommandList()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
