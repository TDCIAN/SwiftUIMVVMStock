//
//  Webservice.swift
//  StocksAppSwiftUI
//
//  Created by JeongminKim on 2022/05/28.
//

import Foundation

class Webservice {
    func getStocks(completion: @escaping (([Stock]?) -> Void )) {
        guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else {
            print("Webserivce - badURL - \(URLError(.badURL))")
            fatalError("URL is not correct")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Webserivce - cannotLoadFromNetwork - \(URLError(.cannotLoadFromNetwork))")
                completion(nil)
                return
            }
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            print("Webserivce - cannotParseResponse - \(URLError(.cannotParseResponse))")
            stocks == nil ? completion(nil) : completion(stocks)
        }.resume()
    }
}
