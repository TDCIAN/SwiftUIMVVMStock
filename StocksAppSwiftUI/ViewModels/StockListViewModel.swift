//
//  StockListViewModel.swift
//  StocksAppSwiftUI
//
//  Created by JeongminKim on 2022/05/28.
//

import Foundation

class StockListViewModel: ObservableObject {
    @Published var searchTerm: String = ""
    @Published var stocks: [StockViewModel] = [StockViewModel]()
    
    func load() {
        fetchStocks()
    }
    
    private func fetchStocks() {
        Webservice().getStocks { stocks in
            if let stocks = stocks {
                DispatchQueue.main.async {
                    self.stocks = stocks.map(StockViewModel.init)
//                    self.stocks = stocks.map { StockViewModel(stock: $0) }
                }
            }
        }
    }
}
