//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Max Ellisen on 26.08.2023.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
