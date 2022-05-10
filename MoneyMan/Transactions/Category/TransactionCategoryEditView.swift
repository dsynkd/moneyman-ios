//
//  TransactionCategoryEditView.swift
//  MoneyMan
//
//  Created by Darren Sadr on 5/9/22.
//

import Foundation
import SwiftUI

struct TransactionCategoryEditView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss
    
    @State var category: TransactionCategory
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Text("Name")
                    Spacer()
                    TextField("Name", text: $category.name)
                    .multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("Budget")
                    Spacer()
                    TextField("Budget", value: $category.budget, formatter: .number)
                    .multilineTextAlignment(.trailing)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    saveCategory()
                    dismiss()
                }
                .disabled(category.name.isEmpty)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func saveCategory() {
        let _ = TransactionCategoryEntity(from: category, context: viewContext)
        try! viewContext.save()
    }
}
