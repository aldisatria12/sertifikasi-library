//
//  User+CoreDataProperties.swift
//  sertifikasi-library
//
//  Created by Aldi Mahotma on 17/12/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var create_date: Date?
    @NSManaged public var username: String?
    @NSManaged public var address: String?
    @NSManaged public var phone: String?
    @NSManaged public var is_admin: Bool
    @NSManaged public var is_deleted: Bool
    @NSManaged public var loan: NSSet?

}

// MARK: Generated accessors for loan
extension User {

    @objc(addLoanObject:)
    @NSManaged public func addToLoan(_ value: Loan)

    @objc(removeLoanObject:)
    @NSManaged public func removeFromLoan(_ value: Loan)

    @objc(addLoan:)
    @NSManaged public func addToLoan(_ values: NSSet)

    @objc(removeLoan:)
    @NSManaged public func removeFromLoan(_ values: NSSet)

}

extension User : Identifiable {

}
