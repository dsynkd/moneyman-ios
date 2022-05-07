//
//  CryptoWalletModel.swift
//  MoneyMan
//
//  Created by Darren Sadr on 4/17/22.
//

import CoreData
import Foundation
import web3swift

struct CryptoWallet: Hashable, Identifiable {
    var name: String?
    var address: String = ""
    var balance: String {
        let web3 = Web3.InfuraMainnetWeb3()
        let address = EthereumAddress(address)!
        let balance = try! web3.eth.getBalance(address: address)
        let balanceString = Web3.Utils.formatToEthereumUnits(balance, toUnits: .eth, decimals: 3)
        return balanceString!
    }
    var id: Int { hashValue }
}

extension CryptoWallet {
    init(from entity: CryptoWalletEntity) {
        self.address = entity.address ?? "Address Unknown"
        self.name = entity.name
    }
}

extension CryptoWalletEntity {
    convenience init(from wallet: CryptoWallet, context: NSManagedObjectContext) {
        self.init(context: context)
        self.name = wallet.name
        self.address = wallet.address
    }
}

enum Blockchain {
    case bitcoin
    case ethereum
    case cardano
    case cosmos
    case terra
    case solana
}
