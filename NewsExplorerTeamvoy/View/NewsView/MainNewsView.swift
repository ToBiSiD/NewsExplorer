//
//  MainNewsVIew.swift
//  NewsExplorerTeamvoy
//
//  Created by Tobias on 28.07.2023.
//

import SwiftUI

struct MainNewsView: View {
    
    @StateObject private var newsViewModel = NewsViewModel()
    // custom solution to use Button instead of NavigationLink in list (after tap on navLink open new View and close it immediately)
    @State private var isOpenArticle: Bool = false
    @State private var selectedArticle: NewsArticle?
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    NavigationLink("", isActive: $isOpenArticle) {
                        if let article = selectedArticle {
                            DetailedNewsView(newsArticle: article)
                        }
                    }
                    
                    SearchPanelView().environmentObject(newsViewModel)
                    
                    if newsViewModel.news.count != 0 {
                        Divider()
                        
                        VStack {
                            ForEach(newsViewModel.news) { article in
                                Button {
                                    selectedArticle = article
                                    isOpenArticle.toggle()
                                } label: {
                                    NewsRowView(article: article)
                                }
                            }
                        }
                        .background(Color(.systemGray6))
                    } else {
                        searchingResult
                    }
                    
                    Spacer()
                    
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading){
                        Text("NEWS")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                }
            }
        }
    }
    
    
    private var searchingResult: some View {
        VStack {
            if newsViewModel.isSearchingStarted {
                if let errorMessage = newsViewModel.errorText {
                    Text(errorMessage)
                } else {
                    Text("Zero results")
                }
            }
        }
    }
}

struct MainNewsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainNewsView()
        }
    }
}
