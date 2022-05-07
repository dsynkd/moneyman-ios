//
//  ContentView.swift
//  MoneyMan
//
//  Created by Darren Sadr on 4/17/22.
//

import SwiftUI
import CoreData

struct MainView: View {
    
    var body: some View {
        TabView {
            CryptoWalletListView()
                .tabItem {
                    Image(systemName: "bitcoinsign.circle")
                    Text("Wallet")
                }
        }
    }
}
