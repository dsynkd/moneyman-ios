//
//  TransactionCategoryEntity+CoreDataProperties.swift
//  
//
//  Created by Darren Sadr on 5/9/22.
//
//

import Foundation
import CoreData


extension TransactionCategoryEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TransactionCategoryEntity> {
        return NSFetchRequest<TransactionCategoryEntity>(entityName: "TransactionCategoryEntity")
    }

    @NSManaged public var budget: Double
    @NSManaged public var name: String?
    @NSManaged public var parent: TransactionCategoryEntity?
    @NSManaged public var transactions: TransactionEntity?

}
