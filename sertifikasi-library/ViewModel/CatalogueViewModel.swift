//
//  CatalogueViewModel.swift
//  sertifikasi-library
//
//  Created by Aldi Mahotma on 18/12/22.
//

import Foundation
import CoreData
import SwiftUI

class CatalogueViewModel: ObservableObject {
    let container: NSPersistentContainer
    @Published var catalogues: [Catalogue] = []
    
    init() {
        self.container = PersistenceController.shared.container
        fetchCatalogues()
    }
    
    func fetchCatalogues() {
        let request = NSFetchRequest<Catalogue>(entityName: "Catalogue")
        
        do {
            catalogues = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching data. \(error)")
        }
    }
    
    func addCatalogue(name: String, image: UIImage) {
        let newCatalogue = Catalogue(context: container.viewContext)
        newCatalogue.catalogue_name = name
        newCatalogue.catalogue_image = image
        newCatalogue.create_date = Date.now
        newCatalogue.is_deleted = false
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving data. \(error)")
        }
        fetchCatalogues()
    }
}
