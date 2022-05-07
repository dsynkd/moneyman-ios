//
//  AssetEntity+CoreDataProperties.swift
//  
//
//  Created by Darren Sadr on 5/7/22.
//
//

import Foundation
import CoreData


extension AssetEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AssetEntity> {
        return NSFetchRequest<AssetEntity>(entityName: "AssetEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var brands: BrandEntity?

}
