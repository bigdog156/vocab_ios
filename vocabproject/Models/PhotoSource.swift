//
//  rating.swift
//  vocabproject
//
//  Created by Developer on 11/06/2022.
//

import Foundation

enum PhotoSource: Identifiable, CaseIterable{
    case photoLibrary
    case camera
    
    var id: Int{
        hashValue
    }
}
