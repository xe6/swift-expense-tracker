//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Max Ellisen on 26.08.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // MARK: Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    // MARK: Transactions List
                    RecentTransactionsList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // MARK: Notification Icon
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette).foregroundStyle(Color.icon, .primary)
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    static var previews: some View {
        ContentView().environmentObject(transactionListVM).preferredColorScheme(.dark)
    }
}
