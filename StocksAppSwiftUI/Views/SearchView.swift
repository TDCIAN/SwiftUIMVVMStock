//
//  SearchView.swift
//  StocksAppSwiftUI
//
//  Created by JeongminKim on 2022/05/30.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchTerm: String
    
    var body: some View {
        HStack {
            Spacer()
            
            Image(systemName: "magnifyingglass")
            
            TextField("Search", text: $searchTerm)
                .foregroundColor(Color.primary)
                .padding(10)
            
            Spacer()
        }
        .foregroundColor(.secondary)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
        .padding(10)
    }
}
