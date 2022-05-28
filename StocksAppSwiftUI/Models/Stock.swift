//
//  Stock.swift
//  StocksAppSwiftUI
//
//  Created by JeongminKim on 2022/05/28.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Double
    let change: String
}
