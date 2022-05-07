//
//  BrandEntity+CoreDataProperties.swift
//  
//
//  Created by Darren Sadr on 5/7/22.
//
//

import Foundation
import CoreData


extension BrandEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BrandEntity> {
        return NSFetchRequest<BrandEntity>(entityName: "BrandEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var assets: AssetEntity?

}
