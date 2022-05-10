//
//  TransactionAccountCreateView.swift
//  MoneyMan
//
//  Created by Darren Sadr on 5/10/22.
//

import SwiftUI

struct TransactionAccountCreateView: View {
        
    var body: some View {
        NavigationView {
            TransactionAccountEditView(account: TransactionAccount())
                .navigationTitle("Create Account")
        }
    }
}
