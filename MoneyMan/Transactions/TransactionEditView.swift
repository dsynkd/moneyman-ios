//
//  File.swift
//  MoneyMan
//
//  Created by Darren Sadr on 5/9/22.
//

import SwiftUI

struct TransactionEditView: View {

    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss

    @State var transaction: Transaction
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Text("Account")
                    NavigationLink(
                        destination: TransactionAccountListViewContent(transaction: $transaction).setTitle("Select Account")
                    ) {
                        if transaction.account == nil {
                            Spacer()
                            Button("Select") {}
                        } else {
                            Spacer()
                            Text(transaction.account!.fullName)
                        }
                    }
                }
                HStack {
                    Text("Category")
                    NavigationLink(
                        destination: TransactionCategoryListViewContent(transaction: $transaction).setTitle("Select Category")
                    ) {
                        if transaction.category == nil {
                            Spacer()
                            Button("Select") {}
                        } else {
                            Spacer()
                            Text(transaction.category!.name)
                        }
                    }
                }
                HStack {
                    Text("Target")
                    Spacer()
                    TextField("Target", text: $transaction.target)
                    .multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("Amount")
                    Spacer()
                    TextField("Target", value: $transaction.amount, formatter: .number)
                    .multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("Time")
                    Spacer()
                    DatePicker("", selection: $transaction.time, displayedComponents: [.date, .hourAndMinute])
                    .labelsHidden()
                }
                HStack {
                    Text("Memo")
                    Spacer()
                    TextField("Memo", text: $transaction.description)
                    .multilineTextAlignment(.trailing)
                }
            }
            .textCase(.none)
            Section(header: Text("Itemization")) {
                List {
                    ForEach(transaction.transactions) { subtransaction in
                        HStack {
                            Text(subtransaction.description)
                            Spacer()
                            Text(String(subtransaction.amount))
                        }
                    }
                }
                Button {
                    
                } label: {
                    Label("Add Transaction", systemImage: "plus")
                }
            }
            .textCase(.none)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    saveTransaction()
                    dismiss()
                } label: {
                    Text("Save")
                }
                .disabled(transaction.amount == 0)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func saveTransaction() {
        let _ = TransactionEntity(from: transaction, context: viewContext)
        try! viewContext.save()
    }
}
