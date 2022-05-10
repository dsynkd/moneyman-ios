//
//  NavigationTitleViewModifier.swift
//  MoneyMan
//
//  Created by Darren Sadr on 5/10/22.
//

import SwiftUI

struct NavigationTitleViewModifier: ViewModifier {
    
    var title: String
    
    func body(content: Content) -> some View {
        content.toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Text(title).fontWeight(.semibold)
                    Spacer()
                }
            }
        }
    }
}

extension View {
    func setTitle(_ title: String) -> some View {
        modifier(NavigationTitleViewModifier(title: title))
    }
}
