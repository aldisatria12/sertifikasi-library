//
//  Loan+CoreDataProperties.swift
//  sertifikasi-library
//
//  Created by Aldi Mahotma on 17/12/22.
//
//

import Foundation
import CoreData


extension Loan {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Loan> {
        return NSFetchRequest<Loan>(entityName: "Loan")
    }

    @NSManaged public var loan_date: Date?
    @NSManaged public var return_date: Date?
    @NSManaged public var is_returned: Bool
    @NSManaged public var catalogue: Catalogue?
    @NSManaged public var user: User?

}

extension Loan : Identifiable {

}
