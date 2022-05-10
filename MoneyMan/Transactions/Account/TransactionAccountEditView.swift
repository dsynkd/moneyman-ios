//
//  TransactionAccountEditView.swift
//  MoneyMan
//
//  Created by Darren Sadr on 5/9/22.
//

import SwiftUI

struct TransactionAccountEditView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss
    
    @State var account: TransactionAccount
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Text("Bank")
                    NavigationLink(
                        destination: TransactionBankListViewContent(account: $account).setTitle("Select Bank")
                    ) {
                        if account.bank == nil {
                            Spacer()
                            Button("Select Bank") {}
                        } else {
                            Spacer()
                            Text(account.bank!.name)
                        }
                    }
                }
                HStack {
                    Text("Name")
                    Spacer()
                    TextField("Name", text: $account.name)
                    .multilineTextAlignment(.trailing)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    saveAccount()
                    dismiss()
                }
                .disabled(account.name.isEmpty || account.bank == nil)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func saveAccount() {
        let _ = TransactionAccountEntity(from: account, context: viewContext)
        try! viewContext.save()
    }
}
