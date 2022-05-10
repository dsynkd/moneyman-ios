//
//  TransactionBankEditView.swift
//  MoneyMan
//
//  Created by Darren Sadr on 5/9/22.
//

import SwiftUI

struct TransactionBankEditView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss
    
    @State var bank: TransactionBank
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Text("Name")
                    Spacer()
                    TextField("Name", text: $bank.name)
                        .multilineTextAlignment(.trailing)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    saveBank()
                    dismiss()
                }
            }
        }
    }
    
    private func saveBank() {
        let _ = TransactionBankEntity(from: bank, context: viewContext)
        try! viewContext.save()
    }
}
