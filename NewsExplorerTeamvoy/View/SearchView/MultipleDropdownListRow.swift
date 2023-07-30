//
//  MultipleDropdownListRow.swift
//  NewsExplorerTeamvoy
//
//  Created by Tobias on 28.07.2023.
//

import SwiftUI

struct MultipleDropdownListRow: View {
    let title: String
    var isSelected: Bool
    var action: () -> Void
    var onImageName: String = "checkmark.circle.fill"
    var offImageName: String = "circle"
    
    var body: some View {
        VStack(alignment: .leading) {
            Divider()
            
            Button(action: self.action) {
                HStack {
                    Text(title)
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Image(systemName: isSelected ? onImageName : offImageName)
                }
                .foregroundColor(ColorConstants.buttonTextColor)
                .padding(.horizontal)
            }
        }
    }
}
