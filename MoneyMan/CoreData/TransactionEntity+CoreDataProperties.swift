//
//  TransactionEntity+CoreDataProperties.swift
//  
//
//  Created by Darren Sadr on 5/9/22.
//
//

import Foundation
import CoreData


extension TransactionEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TransactionEntity> {
        return NSFetchRequest<TransactionEntity>(entityName: "TransactionEntity")
    }

    @NSManaged public var amount: Double
    @NSManaged public var memo: String
    @NSManaged public var target: String
    @NSManaged public var time: Date?
    @NSManaged public var account: TransactionAccountEntity?
    @NSManaged public var category: TransactionCategoryEntity?
    @NSManaged public var parent: TransactionEntity?

}
