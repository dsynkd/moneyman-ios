//
//  CryptoWalletCreateView.swift
//  MoneyMan
//
//  Created by Darren Sadr on 4/17/22.
//

import CoreData
import SwiftUI

struct CryptoWalletEditView: View {

    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) private var viewContext
    @State var wallet: CryptoWallet

    var body: some View {
        Form {
            Section {
                HStack {
                    Text("Address")
                    Spacer()
                    TextField("Address", text: $wallet.address)
                        .multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("Name")
                    Spacer()
                    TextField("Name", text: $wallet.name.bound)
                        .multilineTextAlignment(.trailing)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button(action: saveWallet) {
                    Text("Save")
                }.disabled(wallet.address.isEmpty)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    private func saveWallet() {
        let wallet = CryptoWalletEntity(from: wallet, context: viewContext)
        try! viewContext.save()
        dismiss()
    }
}
