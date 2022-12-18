//
//  LoanViewModel.swift
//  sertifikasi-library
//
//  Created by Aldi Mahotma on 18/12/22.
//

import Foundation
import CoreData

class LoanViewModel: ObservableObject {
    let container: NSPersistentContainer
    @Published var loanedCatalogue: [Loan] = []
    
    init() {
        self.container = PersistenceController.shared.container
        fetchLoan()
    }
    
    func fetchLoan() {
        let request = NSFetchRequest<Loan>(entityName: "Loan")
        
        do {
            loanedCatalogue = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching data. \(error)")
        }
    }
    
    func addLoan(user: User, catalogue: Catalogue) {
        let newLoan = Loan(context: container.viewContext)
        newLoan.user = user
        newLoan.catalogue = catalogue
        newLoan.is_returned = false
        newLoan.loan_date = Date.now
        newLoan.loan_date = Date.now.addingTimeInterval(86400 * 7)
        saveData()
    }
    
    func returnLoan(data: Loan) {
        data.setValue(true, forKey: "is_returned")
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving data. \(error)")
        }
        fetchLoan()
    }
}
