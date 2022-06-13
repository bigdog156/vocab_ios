//
//  TextFormField.swift
//  vocabproject
//
//  Created by Developer on 13/06/2022.
//

import SwiftUI

struct TextFormField: View {
    ///Field in TextFormField component
    let label: String
    var placeholder: String = ""
    @Binding var value: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(label)
                .font(.custom("Nunito-Bold", size: 20))
            TextField(placeholder, text: $value)
                .padding()
                .font(.system(.body, design: .rounded))
                .textFieldStyle(.plain)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 1)
                }
                .accentColor(Color.red)
            
        }
        .padding(.horizontal)
    }
}

struct TextFormField_Previews: PreviewProvider {
    static var previews: some View {
        TextFormField(label: "Name", placeholder: "Fill Store name",value: .constant(""))
            .previewLayout(.fixed(width: 300, height: 200))
    }
}
