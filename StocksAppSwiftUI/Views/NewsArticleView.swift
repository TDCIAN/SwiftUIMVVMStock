//
//  NewsArticleView.swift
//  StocksAppSwiftUI
//
//  Created by JeongminKim on 2022/05/30.
//

import SwiftUI
import URLImage

struct NewsArticleView: View {
    
    let newsArticles: [NewsArticleViewModel]
    let onDragBegin: (DragGesture.Value) -> Void
    let onDragEnd: (DragGesture.Value) -> Void
    
    var body: some View {
        let screenSize = UIScreen.main.bounds.size
        
        return VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Top News")
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(2)
                    
                    Text("From News")
                        .foregroundColor(Color.gray)
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(2)
                }
                
                Spacer()
            }
            .padding()
            .contentShape(Rectangle())
            .gesture(
                DragGesture()
                    .onChanged(self.onDragBegin)
                    .onEnded(self.onDragEnd)
            )

            
            ScrollView {
                VStack {
                    ForEach(self.newsArticles, id: \.title) { article in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(article.publication)
                                    .foregroundColor(Color.white)
                                    .font(.custom("Arial", size: 22))
                                    .fontWeight(.bold)
                                
                                Text(article.title)
                                    .font(.custom("Arial", size: 22))
                                    .foregroundColor(Color.white)
                            }
                            
                            Spacer()
                            
                            URLImage(URL(string: article.imageURL)!) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                            }

                        }
                    }
                }.frame(maxWidth: .infinity)
            }
        }
        .frame(width: screenSize.width, height: screenSize.height)
        .background(Color(red: 27/255, green: 28/255, blue: 30/255))
        .cornerRadius(20)
    }
}
