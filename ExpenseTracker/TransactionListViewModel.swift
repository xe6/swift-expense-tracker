//
//  TransactionListViewModel.swift
//  ExpenseTracker
//
//  Created by Max Ellisen on 26.08.2023.
//

import Foundation
import Combine

final class TransactionListViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    
    init() {
        getTransactions()
    }
    
    func getTransactions() {
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.fetchData(for: url, completion: {(result: Result<[Transaction], Error>) in
            switch result {
            case .success(let responseTransactions):
                print("Data: \(responseTransactions)")
                DispatchQueue.main.async {
                    self.transactions = responseTransactions
                }
            case .failure(let error):
                print("Error occurred: \(error)")
            }})
    }
}
