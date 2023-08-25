//
//  Extensions.swift
//  ExpenseTracker
//
//  Created by Max Ellisen on 26.08.2023.
//

import Foundation
import SwiftUI

extension Color {
    static let background = Color("Background")
    static let icon = Color("Icon")
    static let text = Color("Text")
    static let systemBackground = Color(uiColor: .systemBackground)
}

extension URLSession {
  func fetchData<T: Decodable>(for url: URL, completion: @escaping (Result<T, Error>) -> Void) {
    self.dataTask(with: url) { (data, response, error) in
      if let error = error {
        completion(.failure(error))
      }

      if let data = data {
        do {
          let object = try JSONDecoder().decode(T.self, from: data)
          completion(.success(object))
        } catch let decoderError {
          completion(.failure(decoderError))
        }
      }
    }.resume()
  }
}

extension DateFormatter {
    static let allNumericUkraine: DateFormatter = {
        print("Init date formatter")
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        
        return formatter
    }()
}

extension String {
    func dateParsed() -> Date {
        guard let parsedDate = DateFormatter.allNumericUkraine.date(from: self) else { return Date() }
        return parsedDate
    }
}
