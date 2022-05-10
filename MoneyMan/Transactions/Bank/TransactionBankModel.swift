//
//  TransactionBankModel.swift
//  MoneyMan
//
//  Created by Darren Sadr on 5/9/22.
//

import CoreData

struct TransactionBank: Hashable, Codable, Identifiable {
    var name: String = ""
    var id: Int { hashValue }
}

extension TransactionBank {
    init(from entity: TransactionBankEntity?) {
        self.name = entity?.name ?? ""
    }
}

extension TransactionBankEntity {
    convenience init(from bank: TransactionBank?, context: NSManagedObjectContext) {
        self.init(context: context)
        self.name = bank?.name
    }
}
