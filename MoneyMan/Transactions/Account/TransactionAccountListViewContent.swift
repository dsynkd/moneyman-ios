//
//  TransactionAccountListViewContent.swift
//  MoneyMan
//
//  Created by Darren Sadr on 5/9/22.
//

import SwiftUI

struct TransactionAccountListViewContent: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TransactionAccountEntity.name, ascending: true)],
        animation: .default) private var accountEntities: FetchedResults<TransactionAccountEntity>
    @Environment(\.dismiss) var dismiss

    @State var presentCreateView: Bool = false
    var transaction: Binding<Transaction>?
    var accounts: [TransactionAccount] {
        accountEntities.map { TransactionAccount(from: $0) }
    }
    @State var searchText: String = ""
    
    var body: some View {
        List {
            ForEach(accounts) { account in
                VStack {
                    if transaction != nil {
                        Button {
                            transaction!.wrappedValue.account = account
                            dismiss()
                        } label: {
                            Text(account.name)
                        }
                        
                    } else {
                        NavigationLink(destination: TransactionAccountEditView(account: account)) {
                            Text(account.fullName)
                        }
                    }
                }
            }
            .onDelete(perform: deleteItems)
        }
        .listStyle(.grouped)
        .searchable(text: $searchText)
        .usesCustomBackButton()
        .emptyState(accounts.isEmpty) {
            Text("No Accounts Found!")
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    presentCreateView = true
                } label: {
                    Label("Add Transaction", systemImage: "plus")
                }
            }
        }
        .sheet(isPresented: $presentCreateView) {
            TransactionAccountCreateView()
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { accountEntities[$0] }.forEach(viewContext.delete)
            try! viewContext.save()
        }
    }
}
