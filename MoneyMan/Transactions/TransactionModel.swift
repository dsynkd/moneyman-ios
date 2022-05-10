//
//  TransactionModel.swift
//  MoneyMan
//
//  Created by Darren Sadr on 5/9/22.
//

import Foundation
import CoreData

struct Transaction: Hashable, Codable, Identifiable {
    var account: TransactionAccount?
    var time = Date()
    var target: String = ""
    var amount: Double = 0
    var category: TransactionCategory?
    var description: String = ""
    var transactions: [Transaction] = []

    var bank: TransactionBank? { account?.bank }
    var id: Int { hashValue }
}

extension Transaction {
    init(from entity: TransactionEntity) {
        self.account = TransactionAccount(from: entity.account)
        self.time = entity.time ?? Date()
        self.amount = entity.amount
        self.description = entity.memo ?? ""
        self.target = entity.target ?? ""
        self.category = TransactionCategory(from: entity.category)
    }
}

extension TransactionEntity {
    convenience init(from transaction: Transaction, context: NSManagedObjectContext) {
        self.init(context: context)
        self.account = TransactionAccountEntity(from: transaction.account, context: context)
        self.target = transaction.target
        self.amount = transaction.amount
        self.category = TransactionCategoryEntity(from: transaction.category, context: context)
        self.memo = transaction.description
    }
}
