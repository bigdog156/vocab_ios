//
//  FoodAppBar.swift
//  vocabproject
//
//  Created by Developer on 10/06/2022.
//

import Foundation
import UIKit

func initNavigationBar(){
    
    let navBar = UINavigationBarAppearance()
    
    ///Title Large appearance
    navBar.largeTitleTextAttributes = [
        .foregroundColor: UIColor.systemRed,
        .font: UIFont(name: "Nunito-Regular", size: 35)!
    ]
    ///Title Medium appearance when user scroll
    navBar.titleTextAttributes = [
        .foregroundColor: UIColor.systemCyan,
        .font: UIFont(name: "Nunito-Regular", size: 20)!
    ]
    
    navBar.backgroundColor = .clear
    
    UINavigationBar.appearance().standardAppearance = navBar
    UINavigationBar.appearance().scrollEdgeAppearance = navBar
    UINavigationBar.appearance().compactAppearance = navBar
}
