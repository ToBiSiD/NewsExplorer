//
//  MultipleDropdownListView.swift
//  NewsExplorerTeamvoy
//
//  Created by Tobias on 29.07.2023.
//

import SwiftUI

struct MultipleDropdownListView<Option : SearchingOption> : View {
    @Binding var selectedOptions: [Option]
    
    var title: String = "Search in :"
    @State private var isOpen: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    withAnimation {
                        isOpen.toggle()
                    }
                } label: {
                    HStack{
                        Text(title)
                            .padding(.horizontal)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .rotationEffect(.degrees( isOpen ? -180 : 0))
                            .padding(.horizontal)
                    }
                    .foregroundColor(ColorConstants.buttonTextColor)
                    .frame(height: 44)
                }
            }
            
            if isOpen {
                dropdownListView
                    .padding(.vertical)
            }
        }
        .background(ColorConstants.disableButtonColor)
        .cornerRadius(15)
        .shadow(color: ColorConstants.shadowColor, radius: 8)
        .padding(.horizontal)
    }
    
    private var dropdownListView: some View {
        VStack(spacing: 12) {
            ForEachSearchingOptionView(data: Option.allCases as! [Option]) { option in
                MultipleDropdownListRow(title: option.caseTitle, isSelected: isSelected(option)) {
                    selectOption(option)
                }
            }
        }
    }
    
    private func selectOption(_ option: Option){
        if isSelected(option) {
            if selectedOptions.count > 1 {
                selectedOptions.removeAll { $0 == option }
            }
        } else {
            selectedOptions.append(option)
        }
    }
    
    private func isSelected(_ option: Option) -> Bool {
        return selectedOptions.contains(option)
    }
}

