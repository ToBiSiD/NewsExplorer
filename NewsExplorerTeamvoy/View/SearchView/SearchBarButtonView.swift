//
//  SearchBarButtonView.swift
//  NewsExplorerTeamvoy
//
//  Created by Tobias on 30.07.2023.
//

import SwiftUI

struct SearchBarButtonView: View {
    var title: String
    var backgroundColor = ColorConstants.mainButtonColor
    var tapAction: () -> Void
    
    var body: some View {
        Button {
           tapAction()
        } label: {
            Text(title)
                .frame(width: 340, height: 44)
                .foregroundColor(ColorConstants.buttonTextColor)
                .background(backgroundColor)
                .cornerRadius(15)
                .shadow(color: ColorConstants.shadowColor, radius: 8)
        }
    }
}
