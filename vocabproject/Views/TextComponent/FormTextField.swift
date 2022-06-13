//
//  FormTextField.swift
//  vocabproject
//
//  Created by Developer on 13/06/2022.
//

import SwiftUI

struct FormTextField: View {
    let label: String
    @Binding var value: String
    var height: CGFloat = 200
    var body: some View {
        VStack(alignment: .leading){
            Text(label)
                .font(.custom("Nunito-Bold", size: 20))
            TextEditor(text: $value)
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .accentColor(Color.gray)
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 1)
                }
        }
        .padding(.horizontal)
    }
}

struct FormTextField_Previews: PreviewProvider {
    static var previews: some View {
        FormTextField(label: "Description", value: .constant(""))
            .previewDevice("iPhone 12 Pro")
    }
}
