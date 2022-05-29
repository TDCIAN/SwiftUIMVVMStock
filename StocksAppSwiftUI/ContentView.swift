//
//  ContentView.swift
//  StocksAppSwiftUI
//
//  Created by JeongminKim on 2022/05/28.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var stockListViewModel = StockListViewModel()
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor.black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = UIColor.black
        UITableViewCell.appearance().backgroundColor = UIColor.black
        
        stockListViewModel.load()
    }
    
    var body: some View {
        
        let filteredStocks = self.stockListViewModel.searchTerm.isEmpty ? self.stockListViewModel.stocks : self.stockListViewModel.stocks.filter { $0.symbol.starts(with: self.stockListViewModel.searchTerm) }
        
        return NavigationView {
            ZStack(alignment: .leading) {
                Color.black
                
                Text("May 30 2022")
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -400)
                
                SearchView(searchTerm: self.$stockListViewModel.searchTerm)
                    .offset(y: -350)
                
                StockListView(stocks: filteredStocks)
                    .offset(y: 150)
            }
            .navigationBarTitle("Stocks")
        }
        .edgesIgnoringSafeArea(.all)
    }
}
