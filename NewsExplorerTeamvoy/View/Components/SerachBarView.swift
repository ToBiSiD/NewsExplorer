//
//  SerachBarView.swift
//  NewsExplorerTeamvoy
//
//  Created by Tobias on 28.07.2023.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var text: String
    @Binding var isEditing: Bool
    
    var body: some View {
        HStack {
            ImageTextFieldView(textValue: $text, placeholderText: "Search:", imageName: "magnifyingglass",padding: 8, horizontalPadding: 8)
            
            if isEditing {
                Button {
                    isEditing = false
                    text = ""
                    UIApplication.shared.endEditing()
                } label: {
                    Text("Cancel")
                        .foregroundColor(.black)
                }
                .padding(.trailing, 8)
                .transition(.move(edge: .trailing))
            }
        }
    }
}

