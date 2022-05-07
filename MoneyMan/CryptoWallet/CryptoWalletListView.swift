//
//  CryptoWalletListView.swift
//  MoneyMan
//
//  Created by Darren Sadr on 4/17/22.
//

import CoreData
import SwiftUI

struct CryptoWalletListView: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \CryptoWalletEntity.address, ascending: true)],
        animation: .default) private var walletEntities: FetchedResults<CryptoWalletEntity>
    
    private var wallets: [CryptoWallet] {
        walletEntities.map { CryptoWallet(from: $0) }
    }
    @State var searchText: String = ""
    @State var presentCreateCryptoWallet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(wallets) { wallet in
                    NavigationLink {
                        CryptoWalletEditView(wallet: wallet)
                        .navigationTitle("Edit Wallet")
                    } label: {
                        HStack {
                            Text(wallet.name ?? wallet.address)
                            Spacer()
                            Text(wallet.balance)
                        }
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .listStyle(.grouped)
            .searchable(text: $searchText)
            .toolbar {
                ToolbarItem {
                    Button(action: { presentCreateCryptoWallet = true }) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .navigationTitle("Wallets")
            .navigationBarTitleDisplayMode(.inline)
        }.sheet(isPresented: $presentCreateCryptoWallet) {
            CryptoWalletCreateView()
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { walletEntities[$0] }.forEach(viewContext.delete)
            try! viewContext.save()
        }
    }
}
