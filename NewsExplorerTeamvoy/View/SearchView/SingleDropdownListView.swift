//
//  SingleDropdownListView.swift
//  NewsExplorerTeamvoy
//
//  Created by Tobias on 29.07.2023.
//

import SwiftUI

struct SingleDropdownListView<Option : SearchingOption> : View {
    @Binding var selectedOption: Option
    let title: String
    
    var body: some View {
        VStack(spacing: 12) {
            
            HStack{
                Text(title)
                    .padding(.horizontal)

                Picker("",selection: $selectedOption)
                {
                    ForEachSearchingOptionView(data: Option.allCases as! [Option]) { option in
                        Text(option.caseTitle)
                    }
                }
                .pickerStyle(.segmented)
            }
            .foregroundColor(ColorConstants.mainTextColor)
            .frame(height: 44)
        }
    }
}
