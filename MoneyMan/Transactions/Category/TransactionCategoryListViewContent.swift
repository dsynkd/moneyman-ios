//
//  TransactionCategoryListViewContent.swift
//  MoneyMan
//
//  Created by Darren Sadr on 5/9/22.
//

import SwiftUI

struct TransactionCategoryListViewContent: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TransactionCategoryEntity.name, ascending: true)],
        animation: .default) private var categoryEntities: FetchedResults<TransactionCategoryEntity>
    @Environment(\.dismiss) var dismiss

    @State var presentCreateView: Bool = false
    var transaction: Binding<Transaction>?
    var categories: [TransactionCategory] {
        categoryEntities.map { TransactionCategory(from: $0) }
    }

    @State var searchText: String = ""
    
    var body: some View {
        List {
            ForEach(categories) { category in
                VStack {
                    if transaction != nil {
                        Button {
                            transaction!.wrappedValue.category = category
                            dismiss()
                        } label: {
                            Text(category.name)
                        }
                    } else {
                        NavigationLink {
                            TransactionCategoryEditView(category: category)
                            .navigationTitle("Edit Category")
                        } label: {
                            HStack {
                                Text(category.name)
                                Spacer()
                                Text(String(category.budget))
                            }
                        }
                    }
                }
            }
            .onDelete(perform: deleteItems)
        }
        .listStyle(.grouped)
        .searchable(text: $searchText)
        .usesCustomBackButton()
        .emptyState(categories.isEmpty) {
            Text("No Categories Found!")
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
            TransactionCategoryCreateView()
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { categoryEntities[$0] }.forEach(viewContext.delete)
            try! viewContext.save()
        }
    }
}
