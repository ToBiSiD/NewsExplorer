//
//  SearchPanelView.swift
//  NewsExplorerTeamvoy
//
//  Created by Tobias on 28.07.2023.
//

import SwiftUI

struct SearchPanelView: View {
    
    @EnvironmentObject var viewModel: NewsViewModel
    @State private var isEditing: Bool = false
    @State private var isOpenSearchSettings: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                SearchBarView(text: $viewModel.searchText, isEditing: $isEditing)
                    .onTapGesture {
                        isEditing.toggle()
                    }
                
                Button {
                    withAnimation {
                        isOpenSearchSettings.toggle()
                    }
                } label: {
                    Image(systemName: "chevron.down")
                        .frame(width: 44, height: 44)
                        .rotationEffect(.degrees( isOpenSearchSettings ? -180 : 0))
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(color: Color(.darkGray), radius: 10)
                    
                }
            }
            
            Divider()
            if isOpenSearchSettings {
                VStack(alignment: .leading, spacing: 20) {
                    VStack {
                        SearchDatePicker(selectedDate: $viewModel.fromDate, title: "From:", maxDateConstrain: viewModel.toDate)
                        
                        SearchDatePicker(selectedDate: $viewModel.toDate, title: "To:", minDateConstrain: viewModel.fromDate)
                    }
                    
                    Divider()
                    
                    MultipleDropdownListView(selectedOptions: $viewModel.searchIn, title: "Search in:")
                    MultipleDropdownListView(selectedOptions: $viewModel.languages, title: "Languages:")
                    
                    Divider()
                    
                    SingleDropdownListView(selectedOption: $viewModel.sortBy, title: "Sort by:")
                    
                    Divider()
                }
            }
            
            SearchBarButtonView(title: "Reset") {
                viewModel.resetSearchingSettings()
            }
            
            SearchBarButtonView(title: "Search", backgroundColor: viewModel.searchText.isEmpty ? Color(.systemGray) : Color(.systemBlue)) {
                withAnimation() {
                    isOpenSearchSettings = false
                }
                viewModel.searchNews()
            }
            .disabled(viewModel.searchText.isEmpty)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct SearchPanelView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPanelView()
            .environmentObject(NewsViewModel())
    }
}
