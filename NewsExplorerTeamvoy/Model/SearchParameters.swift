//
//  NewsSearchParameters.swift
//  NewsExplorerTeamvoy
//
//  Created by Tobias on 28.07.2023.
//

import Foundation

struct SearchParameters {
    let query: String?
    let from: Date?
    let to: Date?
    let sortBy: SortingOption?
    let searchIn: [SearchInOption]?
    let languages: [LanguageOption]?
    
    var searchInString: String {
        if let searchIn = searchIn {
            if searchIn.count > 1 {
                let resultsInString = searchIn.map { $0.rawValue }
                return resultsInString.joined(separator: ",")
            } else if let first = searchIn.first {
                return first.rawValue
            } else {
                let resultsInString = SearchInOption.allCases.map {$0.rawValue}
                return resultsInString.joined(separator: ",")
            }
        } else {
            let resultsInString = SearchInOption.allCases.map {$0.rawValue}
            return resultsInString.joined(separator: ",")
        }
    }
    
    var languagesString: String {
        if let languages = languages {
            if languages.count > 1 {
                let resultsInString = languages.map { $0.rawValue }
                return resultsInString.joined(separator: ",")
            } else if let first = languages.first {
                return first.rawValue
            } else {
                let resultsInString = LanguageOption.allCases.map {$0.rawValue}
                return resultsInString.joined(separator: ",")
            }
        } else {
            let resultsInString = LanguageOption.allCases.map {$0.rawValue}
            return resultsInString.joined(separator: ",")
        }
    }
}
