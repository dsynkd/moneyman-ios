//
//  TransactionCategoryModel.swift
//  MoneyMan
//
//  Created by Darren Sadr on 5/9/22.
//

import CoreData

struct TransactionCategory: Hashable, Codable, Identifiable {
    var name: String = ""
    var budget: Double = 0
    var categories: [TransactionCategory] = []

    var id: Int { hashValue }
}

extension TransactionCategory {
    init(from entity: TransactionCategoryEntity?) {
        self.name = entity?.name ?? ""
        self.budget = entity?.budget ?? 0
    }
}

extension TransactionCategoryEntity {
    convenience init(from category: TransactionCategory?, context: NSManagedObjectContext) {
        self.init(context: context)
        self.name = category?.name
        self.budget = category?.budget ?? 0
    }
}
