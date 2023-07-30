//
//  NewsViewModel.swift
//  NewsExplorerTeamvoy
//
//  Created by Tobias on 28.07.2023.
//

import Foundation

class NewsViewModel : ObservableObject {
    @Published var news: [NewsArticle] = []
    @Published var errorText: String?
    @Published var isSearchingStarted: Bool = false
    
    @Published var searchText: String = ""
    @Published var isEditing: Bool = false
    @Published var fromDate: Date = Constants.dateFromConstrains!
    @Published var toDate: Date = Date()
    @Published var sortBy: SortingOption = .publishedAt
    @Published var searchIn: [SearchInOption] = SearchInOption.allCases
    @Published var languages: [LanguageOption] = LanguageOption.allCases
    
    private let api = NewsAPIService()
    
    func searchNews() {
        self.fetchNews(searchParameters: SearchParameters(query: searchText, from: fromDate, to: toDate, sortBy: sortBy, searchIn: searchIn, languages: languages))
        isSearchingStarted = true
    }
    
    private func fetchNews(searchParameters: SearchParameters) {
        api.fetchNews(searchParameters: searchParameters) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let news):
                    self.news = news
                    self.errorText = nil
                case .failure(let error):
                    print("Error fetching news: \(error.localizedDescription)")
                    self.errorText = error.localizedDescription
                }
            }
        }
    }
    
    func resetSearchingSettings(){
        isEditing = false
        fromDate = Constants.dateFromConstrains!
        toDate = Date()
        sortBy = .publishedAt
        searchIn = SearchInOption.allCases
        languages = LanguageOption.allCases
        isSearchingStarted = false
    }
}
