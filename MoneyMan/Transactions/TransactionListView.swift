//
//  TransactionListView.swift
//  MoneyMan
//
//  Created by Darren Sadr on 5/9/22.
//

import SwiftUI

struct TransactionListView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TransactionEntity.time, ascending: true)],
        animation: .default) private var transactionEntities: FetchedResults<TransactionEntity>
    
    private var transactions: [Transaction] {
        transactionEntities.map { Transaction(from: $0) }
    }
    @State var searchText: String = ""
    @State var presentCreateTransaction = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(transactions) { transaction in
                    NavigationLink {
                        TransactionEditView(transaction: transaction)
                        .navigationTitle("Edit Wallet")
                    } label: {
                        VStack {
                            Text(transaction.time.timestamp)
                            Text(transaction.target)
                            Text(String(transaction.amount))
                        }
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .listStyle(.grouped)
            .searchable(text: $searchText)
            .toolbar {
                ToolbarItem {
                    Button(action: { presentCreateTransaction = true }) {
                        Label("Add Transaction", systemImage: "plus")
                    }
                }
            }
            .navigationTitle("Transactions")
            .navigationBarTitleDisplayMode(.inline)
        }
        .sheet(isPresented: $presentCreateTransaction) {
            TransactionCreateView()
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { transactionEntities[$0] }.forEach(viewContext.delete)
            try! viewContext.save()
        }
    }
}
