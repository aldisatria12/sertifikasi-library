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
        catalogues = catalogues.filter({ $0.is_deleted == false })
    }
    
    func addCatalogue(name: String, image: UIImage) {
        let newCatalogue = Catalogue(context: container.viewContext)
        newCatalogue.catalogue_name = name
        newCatalogue.catalogue_image = image
        newCatalogue.create_date = Date.now
        newCatalogue.is_deleted = false
        saveData()
    }
    
    func editCatalogue(data: Catalogue, name: String, image: UIImage) {
        data.setValue(name, forKey: "catalogue_name")
        data.setValue(image, forKey: "catalogue_image")
        saveData()
    }
    
    func deleteCatalogue(data: Catalogue) {
        data.setValue(true, forKey: "is_deleted")
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
