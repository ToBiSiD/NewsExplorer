//
//  NewsArticle.swift
//  NewsExplorerTeamvoy
//
//  Created by Tobias on 28.07.2023.
//

import Foundation

struct NewsArticle: Identifiable, Codable {
    var id: UUID {
        return UUID() // Unique identifier for each article
    }
    
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let author: String?
    let source: Source
    let publishedAt: Date
    
    struct Source: Codable {
        let name: String
    }
    
    var formattedPublishedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm, d MMM y (E)"
        return formatter.string(from: publishedAt)
    }
}

extension NewsArticle {
    static let MOCK_ARTICLE = NewsArticle(title: "Title", description: "Description", url: "www.google.com", urlToImage: "ttps://i.insider.com/649f038dfd8a3e0019122191?width=1200&format=jpeg", author: "Author", source: Source(name: "sourceName"), publishedAt: Date())
}

