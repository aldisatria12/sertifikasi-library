//
//  Catalogue+CoreDataProperties.swift
//  sertifikasi-library
//
//  Created by Aldi Mahotma on 17/12/22.
//
//

import Foundation
import CoreData


extension Catalogue {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Catalogue> {
        return NSFetchRequest<Catalogue>(entityName: "Catalogue")
    }

    @NSManaged public var catalogue_name: String?
    @NSManaged public var catalogue_image: String?
    @NSManaged public var is_deleted: Bool
    @NSManaged public var create_date: Date?
    @NSManaged public var loan: NSSet?

}

// MARK: Generated accessors for loan
extension Catalogue {

    @objc(addLoanObject:)
    @NSManaged public func addToLoan(_ value: Loan)

    @objc(removeLoanObject:)
    @NSManaged public func removeFromLoan(_ value: Loan)

    @objc(addLoan:)
    @NSManaged public func addToLoan(_ values: NSSet)

    @objc(removeLoan:)
    @NSManaged public func removeFromLoan(_ values: NSSet)

}

extension Catalogue : Identifiable {

}
