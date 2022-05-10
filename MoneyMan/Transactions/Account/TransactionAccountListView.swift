//
//  TransactionAccountListView.swift
//  MoneyMan
//
//  Created by Darren Sadr on 5/9/22.
//

import SwiftUI

struct TransactionAccountListView: View {

    @State var presentCreateAccount = false
    
    var body: some View {
        NavigationView {
            TransactionAccountListViewContent()
            .navigationTitle("Accounts")
        }
        .sheet(isPresented: $presentCreateAccount) {
            TransactionAccountCreateView()
        }
    }
}
