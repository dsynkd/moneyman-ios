//
//  TransactionAccountEntity+CoreDataProperties.swift
//  
//
//  Created by Darren Sadr on 5/9/22.
//
//

import Foundation
import CoreData


extension TransactionAccountEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TransactionAccountEntity> {
        return NSFetchRequest<TransactionAccountEntity>(entityName: "TransactionAccountEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var bank: TransactionBankEntity?
    @NSManaged public var transactions: TransactionEntity?

}
