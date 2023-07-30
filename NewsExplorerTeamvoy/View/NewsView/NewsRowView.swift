//
//  NewsRowView.swift
//  NewsExplorerTeamvoy
//
//  Created by Tobias on 28.07.2023.
//

import SwiftUI

struct NewsRowView: View {
    let article: NewsArticle
    
    var body: some View {
        VStack(alignment: .leading) {
            Divider()
                .frame(height: 2)
                .background(Color(.systemGray))
            
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .multilineTextAlignment(.leading)
                
                Divider()
                    .background(Color(.systemGray))
                    .padding(.bottom, 10)
                
                if let description = article.description {
                    Text(description)
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)
                }
                
            }
            .padding(.vertical,10)
            .padding(.horizontal,10)
            
            Divider()
                .frame(height: 2)
                .background(Color(.systemGray))
        }
        .background(Color(.systemGray6))
        .foregroundColor(ColorConstants.mainTextColor)
        .frame(maxHeight: 150)
        
    }
}

struct NewsRowView_Previews: PreviewProvider {
    static var previews: some View {
        NewsRowView(article: NewsArticle.MOCK_ARTICLE)
    }
}
