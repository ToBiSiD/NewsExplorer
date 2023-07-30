//
//  NewsView.swift
//  NewsExplorerTeamvoy
//
//  Created by Tobias on 28.07.2023.
//

import SwiftUI

struct DetailedNewsView: View {
    var newsArticle: NewsArticle
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                DetailedTextInfoView(title: "Title:", text: newsArticle.title)
                
                if let description = newsArticle.description {
                    DetailedTextInfoView(title: "Description:", text: description)
                }
                
                if let author = newsArticle.author {
                    DetailedTextInfoView(title: "Author:", text: author)
                }
                
                DetailedTextInfoView(title: "Published at:", text: newsArticle.formattedPublishedDate)
                
                DetailedTextInfoView(title: "Source:", text: newsArticle.source.name)
                
                if let imageURL = newsArticle.urlToImage {
                    AsyncImage(url: URL(string: imageURL)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ZStack {
                            Color.gray
                            
                            VStack {
                                SpinningCircle(lineWidth: 7, color: .white)
                                    .frame(width: 100)
                                
                                AnimatedTextWithDotsView(text: "Loading").foregroundColor(.white)
                            }
                            .padding(.vertical, 30)
                            
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width - 100, height: UIScreen.main.bounds.width - 100)
                }
                
                if let url = newsArticle.url {
                    
                    NavigationLink {
                        WebView(urlString: url)
                    } label: {
                        Text("Jump to Article")
                            .frame(width: 340, height: 44)
                            .foregroundColor(ColorConstants.buttonTextColor)
                            .background(ColorConstants.mainButtonColor)
                            .cornerRadius(15)
                            .shadow(color: ColorConstants.shadowColor, radius: 8)
                    }
                    
                }
            }
        }
    }
}


struct DetailedNewsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedNewsView(newsArticle: NewsArticle.MOCK_ARTICLE)
    }
}
