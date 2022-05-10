//
//  App.swift
//  MoneyMan
//
//  Created by Darren Sadr on 4/17/22.
//

import SwiftUI

@main
struct MoneyMan: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

extension Optional where Wrapped == String {
    var _bound: String? {
        get {
            return self
        }
        set {
            self = newValue
        }
    }
    public var bound: String {
        get {
            return _bound ?? ""
        }
        set {
            _bound = newValue.isEmpty ? nil : newValue
        }
    }
}

extension Date {
    var timestamp: String {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd hh:mm:ss"
        return df.string(from: self)
    }
}

extension Formatter {
    static let number = NumberFormatter()
}
