//
//  ForEachSearchingOptionView.swift
//  NewsExplorerTeamvoy
//
//  Created by Tobias on 29.07.2023.
//

import SwiftUI

struct ForEachSearchingOptionView<T: SearchingOption, Content: View>: View {
    let data: [T]
    let content: (T) -> Content

    init(data: [T], @ViewBuilder content: @escaping (T) -> Content) {
        self.data = data
        self.content = content
    }

    var body: some View {
        ForEach(data, id: \.self) { item in
            content(item)
        }
    }
}
