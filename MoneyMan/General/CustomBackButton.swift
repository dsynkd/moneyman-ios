//
//  CustomBackButton.swift
//  MoneyMan
//
//  Created by Darren Sadr on 5/10/22.
//

import SwiftUI

struct CustomBackButtonViewModifier: ViewModifier {
    
    @Environment(\.dismiss) var dismiss
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                }
            }
        }
    }
}

extension View {
    func usesCustomBackButton() -> some View {
        modifier(CustomBackButtonViewModifier())
    }
}
