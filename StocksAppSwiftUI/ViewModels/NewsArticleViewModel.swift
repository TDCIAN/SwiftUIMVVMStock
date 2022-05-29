//
//  NewsArticleViewModel.swift
//  StocksAppSwiftUI
//
//  Created by JeongminKim on 2022/05/30.
//

import Foundation

struct NewsArticleViewModel {
    let article: Article
    
    var imageURL: String {
        return self.article.imageURL
    }
    
    var title: String {
        return self.article.title
    }
    
    var publication: String {
        return self.article.publication.uppercased()
    }
}
