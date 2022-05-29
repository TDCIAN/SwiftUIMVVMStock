//
//  Webservice.swift
//  StocksAppSwiftUI
//
//  Created by JeongminKim on 2022/05/28.
//

import Foundation

class Webservice {
    func getTopNews(completion: @escaping (([Article]?) -> Void )) {
        guard let url = URL(string: "https://island-bramble.glitch.me/top-news") else {
            fatalError("URL is not correct")
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let articles = try? JSONDecoder().decode([Article].self, from: data)
            DispatchQueue.main.async {
                completion(articles)
            }
        }.resume()
    }
    
    func getStocks(completion: @escaping (([Stock]?) -> Void )) {
        guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else {
            print("Webserivce - getStocks - badURL - \(URLError(.badURL))")
            fatalError("URL is not correct")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Webserivce - getStocks - cannotLoadFromNetwork - \(URLError(.cannotLoadFromNetwork))")
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            print("Webserivce - getStocks - cannotParseResponse - \(URLError(.cannotParseResponse))")
            DispatchQueue.main.async {
                stocks == nil ? completion(nil) : completion(stocks)
            }
        }.resume()
    }
}
