//
//  UserViewModel.swift
//  sertifikasi-library
//
//  Created by Aldi Mahotma on 18/12/22.
//

import Foundation
import CoreData

class UserViewModel: ObservableObject {
    let container: NSPersistentContainer
    @Published var users: [User] = []
    
    init() {
        self.container = PersistenceController.shared.container
        fetchUsers()
    }
    
    func fetchUsers() {
        let request = NSFetchRequest<User>(entityName: "User")
        
        do {
            users = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching data. \(error)")
        }
    }
    
    func addUser(name: String, address: String?, is_admin: Bool, phone: String) {
        let newUser = User(context: container.viewContext)
        newUser.username = name
        newUser.address = address
        newUser.create_date = Date.now
        newUser.is_deleted = false
        newUser.is_admin = is_admin
        newUser.phone = phone
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving data. \(error)")
        }
        fetchUsers()
    }
}
