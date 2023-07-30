//
//  SearchDatePicker.swift
//  NewsExplorerTeamvoy
//
//  Created by Tobias on 30.07.2023.
//

import SwiftUI

struct SearchDatePicker: View {
    
    @Binding var selectedDate: Date
    let title: String
    var maxDateConstrain: Date = Date()
    var minDateConstrain: Date = Constants.dateFromConstrains!
    
    var body: some View {
        DatePicker(title, selection: $selectedDate, in: (minDateConstrain...maxDateConstrain),displayedComponents: [.date]
        )
        .foregroundColor(ColorConstants.mainTextColor)
            .datePickerStyle(.compact)
    }
}

struct SearchDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        SearchDatePicker(selectedDate: .constant(Date()), title: "From:")
    }
}
