//
//  DetailedTextInfoView.swift
//  NewsExplorerTeamvoy
//
//  Created by Tobias on 28.07.2023.
//

import SwiftUI

struct DetailedTextInfoView: View {
    var title: String
    var text: String
    
    var body: some View {
        VStack{
            HStack(alignment: .top) {
                Text(title)
                    .fontWeight(.semibold)
                
                Text(text)
                
                Spacer()
            }
            .foregroundColor(.black)
            .padding(.horizontal)
            
            Divider()
        }
    }
}
struct DetailedTextInfoView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedTextInfoView(title: "Title", text: "text")
    }
}
