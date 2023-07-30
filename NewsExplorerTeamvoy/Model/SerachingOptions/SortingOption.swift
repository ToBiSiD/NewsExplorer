//
//  SortingOption.swift
//  NewsExplorerTeamvoy
//
//  Created by Tobias on 28.07.2023.
//

import Foundation

enum SortingOption: String, SearchingOption {
    case relevancy
    case popularity
    case publishedAt = "publishedAt"
    
    var caseTitle: String {
        switch self{
        case .relevancy: return "Relevancy"
        case .popularity: return "Popularity"
        case .publishedAt: return "Published At"
        }
    }
}
