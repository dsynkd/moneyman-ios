//
//  CryptoWalletEntity+CoreDataProperties.swift
//  
//
//  Created by Darren Sadr on 5/7/22.
//
//

import Foundation
import CoreData


extension CryptoWalletEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CryptoWalletEntity> {
        return NSFetchRequest<CryptoWalletEntity>(entityName: "CryptoWalletEntity")
    }

    @NSManaged public var address: String?
    @NSManaged public var name: String?

}
