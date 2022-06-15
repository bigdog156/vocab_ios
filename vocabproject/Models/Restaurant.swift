//
//  Restaurant.swift
//  vocabproject
//
//  Created by Developer on 09/06/2022.
//

import Foundation
import CoreData
public class Restaurant: NSManagedObject{
    @NSManaged public var name: String
    @NSManaged public var type: String
    @NSManaged public var location: String
    @NSManaged public var phone: String
    @NSManaged public var image: Data
    @NSManaged public var ratingText: String?
    @NSManaged public var info: String
    @NSManaged public var isFavorite: Bool
}

extension Restaurant{


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
    
    var rating: Rating? {
        get {
            guard let ratingText = ratingText else { return nil }
            return Rating(rawValue: ratingText)
        }
        set{
            self.ratingText = newValue?.rawValue
        }
    }

}
