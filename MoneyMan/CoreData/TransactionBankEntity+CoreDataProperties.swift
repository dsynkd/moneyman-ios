//
//  TransactionBankEntity+CoreDataProperties.swift
//  
//
//  Created by Darren Sadr on 5/9/22.
//
//

import Foundation
import CoreData


extension TransactionBankEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TransactionBankEntity> {
        return NSFetchRequest<TransactionBankEntity>(entityName: "TransactionBankEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var accounts: TransactionAccountEntity?

}
