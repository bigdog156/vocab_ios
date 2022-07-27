//
//  EndEditing.swift
//  vocabproject
//
//  Created by Developer on 16/06/2022.
//

import UIKit

extension UIApplication{
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
