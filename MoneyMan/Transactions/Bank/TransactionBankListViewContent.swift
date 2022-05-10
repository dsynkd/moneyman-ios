//
//  TransactionBankListViewContent.swift
//  MoneyMan
//
//  Created by Darren Sadr on 5/9/22.
//

import SwiftUI

struct TransactionBankListViewContent: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TransactionBankEntity.name, ascending: true)],
        animation: .default) private var bankEntities: FetchedResults<TransactionBankEntity>
    @Environment(\.dismiss) var dismiss

    @State var presentCreateView: Bool = false
    var account: Binding<TransactionAccount>?
    var banks: [TransactionBank] {
        bankEntities.map { TransactionBank(from: $0) }
    }
    @State var searchText: String = ""
        
    var body: some View {
        List {
            ForEach(banks) { bank in
                VStack {
                    if account != nil {
                        Button {
                            account!.wrappedValue.bank = bank
                            dismiss()
                        } label: {
                            Text(bank.name)
                        }
                    } else {
                        NavigationLink(destination: TransactionBankEditView(bank: bank)) {
                            Text(bank.name)
                        }
                    }
                }
            }
            .onDelete(perform: deleteItems)
        }
        .searchable(text: $searchText)
        .listStyle(.grouped)
        .usesCustomBackButton()
        .emptyState(banks.isEmpty) {
            Text("No Banks Found!")
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
            TransactionBankCreateView()
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { bankEntities[$0] }.forEach(viewContext.delete)
            try! viewContext.save()
        }
    }
}
