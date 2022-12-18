//
//  sertifikasi_libraryApp.swift
//  sertifikasi-library
//
//  Created by Aldi Mahotma on 17/12/22.
//

import SwiftUI

@main
struct sertifikasi_libraryApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            AdminLoanedCatalogueView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
