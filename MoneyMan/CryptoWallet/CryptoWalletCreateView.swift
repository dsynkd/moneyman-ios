//
//  CryptoWalletCreateView.swift
//  MoneyMan
//
//  Created by Darren Sadr on 5/7/22.
//

import CoreData
import SwiftUI

struct CryptoWalletCreateView: View {

    var body: some View {
        NavigationView {
            CryptoWalletEditView(wallet: CryptoWallet())
                .navigationTitle("Create New Wallet")
        }
    }
}
