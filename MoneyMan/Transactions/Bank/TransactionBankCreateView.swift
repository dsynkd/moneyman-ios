//
//  TransactionBankCreateView.swift
//  MoneyMan
//
//  Created by Darren Sadr on 5/10/22.
//

import SwiftUI

struct TransactionBankCreateView: View {
    var body: some View {
        NavigationView {
            TransactionBankEditView(bank: TransactionBank())
                .navigationTitle("Create Bank")
        }
    }
}
