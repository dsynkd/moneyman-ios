//
//  TransactionAccountModekl.swift
//  MoneyMan
//
//  Created by Darren Sadr on 5/9/22.
//

import CoreData

struct TransactionAccount: Hashable, Codable, Identifiable {
    var name: String = ""
    var bank: TransactionBank?
    var fullName: String { "[\(bank!.name)] \(name)" }
    var id: Int { hashValue }
}

extension TransactionAccount {
    init(from entity: TransactionAccountEntity?) {
        self.name = entity?.name ?? ""
        self.bank = TransactionBank(from: entity?.bank)
    }
}

extension TransactionAccount {
    static let chaseFreedom = TransactionAccount(name: "Freedom")
    static let venmo = TransactionAccount(name: "Venmo")
    static let appleCard = TransactionAccount(name: "Apple Card")
}

extension TransactionAccountEntity {
    convenience init(from account: TransactionAccount?, context: NSManagedObjectContext) {
        self.init(context: context)
        self.name = account?.name
        self.bank = TransactionBankEntity(from: account?.bank, context: context)
    }
}

