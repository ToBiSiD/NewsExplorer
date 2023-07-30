//
//  Constants.swift
//  NewsExplorerTeamvoy
//
//  Created by Tobias on 30.07.2023.
//

import Foundation

struct Constants {
    static let apiKey = "aa9432832135417daf060f00a285c68e"
    static let apiLink = "https://newsapi.org/v2/everything"
    
    struct QueryParametrTitles {
        static let apiKey = "apiKey"
        static let query = "q"
        static let from = "from"
        static let to = "to"
        static let sortBy = "sortBy"
        static let searchIn = "searchIn"
        static let languages = "languages"
    }
    
    static let dateFromConstrains = Calendar.current.date(byAdding: .month, value: -1, to: Date())
}
