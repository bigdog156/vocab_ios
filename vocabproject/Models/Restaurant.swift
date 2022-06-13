//
//  Restaurant.swift
//  vocabproject
//
//  Created by Developer on 09/06/2022.
//

import Foundation

struct Restaurant{
    
    var name: String = ""
    var type: String = ""
    var location: String = ""
    var image: String = ""
    var isFavorite: Bool = false
    var emoj: Rating?
    
    init(name: String, type: String, location: String, image: String, isFavorite: Bool){
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isFavorite = isFavorite
    }
    
    mutating func onFavorite(){
        isFavorite.toggle()
    }
    
    enum Rating: String, CaseIterable {
        case awesome
        case good
        case okey
        case bad
        case terrible
        
        var image: String{
            
            switch self{
            case .awesome: return "love"
            case .good: return "cool"
            case .okey: return "happy"
            case .bad: return "sad"
            case .terrible: return "angry"
                
            }
        }
    }

}
