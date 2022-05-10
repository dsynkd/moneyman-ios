//
//  TransactionCategoryListView.swift
//  MoneyMan
//
//  Created by Darren Sadr on 5/9/22.
//

import SwiftUI

struct TransactionCategoryListView: View {
    
    @State var presentCreateTransactionCategory: Bool = false
    
    var body: some View {
        NavigationView {
            TransactionCategoryListViewContent()
            .navigationTitle("Transactions")
            .toolbar {
                ToolbarItem {
                    Button(action: { presentCreateTransactionCategory = true }) {
                        Label("Add Transaction", systemImage: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $presentCreateTransactionCategory) {
            TransactionCategoryCreateView()
        }
    }
}
