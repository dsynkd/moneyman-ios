//
//  TransactionCreateView.swift
//  MoneyMan
//
//  Created by Darren Sadr on 5/9/22.
//

import SwiftUI

struct TransactionCreateView: View {
    var body: some View {
        NavigationView {
            TransactionEditView(transaction: Transaction())
                .navigationTitle("Create New Transaction")
        }
    }
}
