//
//  SearchInOption.swift
//  NewsExplorerTeamvoy
//
//  Created by Tobias on 28.07.2023.
//

import Foundation

enum SearchInOption: String, SearchingOption {
    case title
    case description
    case content = "content"
    
    var caseTitle: String {
        switch self {
        case .title: return "Title"
        case .description: return "Description"
        case .content: return "Content"
        }
    }
}
