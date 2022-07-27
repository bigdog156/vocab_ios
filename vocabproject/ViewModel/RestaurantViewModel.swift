//
//  RestaurantViewModel.swift
//  vocabproject
//
//  Created by Developer on 16/06/2022.
//

import Foundation
import Combine
import UIKit
import SwiftUI

class RestaurantFormViewModel: ObservableObject{
    
    //Input
    @Published var name: String = ""
    @Published var type: String = ""
    @Published var location: String = ""
    @Published var phone: String = ""
    @Published var info: String = ""
    @Published var image: UIImage?
    
    init(restaurant: Restaurant? = nil){
        if let restaurant = restaurant {
            self.name = restaurant.name
            self.type = restaurant.type
            self.location = restaurant.location
            self.phone = restaurant.phone
            self.info = restaurant.info
            self.image = UIImage(data: restaurant.image) 
        }
    }
}


