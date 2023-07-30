//
//  ImageTextFieldView.swift
//  NewsExplorerTeamvoy
//
//  Created by Tobias on 28.07.2023.
//

import SwiftUI

struct ImageTextFieldView: View {
    
    @Binding var textValue: String
    let placeholderText: String
    var imageName: String = ""
    var padding: CGFloat = 10
    var cornerRadius: CGFloat = 15
    var horizontalPadding: CGFloat = 30
    var imagePadding: CGFloat = 5
    var buttonSubmitLable: SubmitLabel = .continue
    var submitAction: (() -> Void)?
    
    var body: some View {
        HStack {
            
            if(!imageName.isEmpty){
                HStack {
                    Image(systemName: imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
                .padding(.horizontal, imagePadding)
            }
            
            TextField("", text: $textValue)
                .placeholder(when: textValue.isEmpty, placeholder: {
                    Text(placeholderText).foregroundColor(ColorConstants.buttonTextColor)
                })
                .submitLabel(buttonSubmitLable)
                .onSubmit {
                    if let submitAction = submitAction{
                        submitAction()
                    }
                }
                .font(.subheadline)
        }
        .frame(maxHeight: 35)
        .padding(padding)
        .foregroundColor(ColorConstants.buttonTextColor)
        .background(ColorConstants.disableButtonColor)
        .cornerRadius(cornerRadius)
        .padding(.horizontal, horizontalPadding)
        .shadow(color: ColorConstants.shadowColor, radius: 8)
        
    }
}
