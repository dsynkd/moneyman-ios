//
//  TransactionCategoryCreateView.swift
//  MoneyMan
//
//  Created by Darren Sadr on 5/9/22.
//

import SwiftUI

struct TransactionCategoryCreateView: View {

    var body: some View {
        NavigationView {
            TransactionCategoryEditView(category: TransactionCategory())
                .navigationTitle("Create New Category")
        }
    }
}
