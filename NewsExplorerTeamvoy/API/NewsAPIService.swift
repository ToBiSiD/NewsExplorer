//
//  NewsApiService.swift
//  NewsExplorerTeamvoy
//
//  Created by Tobias on 28.07.2023.
//

import Foundation

class NewsAPIService {
    func fetchNews(searchParameters: SearchParameters, completion: @escaping (Result<[NewsArticle], Error>) -> Void) {
        
        var components = URLComponents(string: Constants.apiLink)
        components?.queryItems = [
            URLQueryItem(name: Constants.QueryParametrTitles.apiKey, value: Constants.apiKey),
            URLQueryItem(name: Constants.QueryParametrTitles.query, value: searchParameters.query),
            URLQueryItem(name: Constants.QueryParametrTitles.from, value: formatDate(searchParameters.from)),
            URLQueryItem(name: Constants.QueryParametrTitles.to, value: formatDate(searchParameters.to)),
            URLQueryItem(name: Constants.QueryParametrTitles.sortBy, value: searchParameters.sortBy?.rawValue),
            URLQueryItem(name: Constants.QueryParametrTitles.searchIn, value: searchParameters.searchInString),
            URLQueryItem(name: Constants.QueryParametrTitles.languages, value: searchParameters.languagesString)
        ]

        print(components?.url ?? "")
        guard let url = components?.url else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let newsResponse = try decoder.decode(News.self, from: data)
                    completion(.success(newsResponse.articles))
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
            }
        }.resume()
    }

    private func formatDate(_ date: Date?) -> String? {
        guard let date = date else { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
}
