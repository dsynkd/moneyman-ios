//
//  AssetModelk.swift
//  MoneyMan
//
//  Created by Darren Sadr on 5/10/22.
//

import Foundation

struct Asset {
    var brand: AssetBrand?
    var name: String = ""
    var category: AssetCategory?
    // Manufacturer Suggested Retail Price
    var msrp: Double?
    // Universal Product Code
    var upc: String?
    // Amazon Standard Identification Number
    var asin: String?
    // International Standard Book Numbers
    var isbn: String?
    // European Article Numbers
    var ean: String?
    // Japanese Article Numbers
    var jan: String?
}

enum GTIN {
    case UPC
    case ISBN
    case EAN
    case JAN
}

struct AssetCategory {
    var name: String = ""
}

struct AssetBrand {
    var name: String = ""
}
