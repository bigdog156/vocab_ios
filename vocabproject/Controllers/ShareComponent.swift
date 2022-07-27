//
//  ShareComponent.swift
//  vocabproject
//
//  Created by Developer on 09/06/2022.
//

import Foundation
import SwiftUI
import UIKit

struct ActivityView: UIViewControllerRepresentable {
    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil
    func makeUIViewController(context: Context) -> some UIViewController {
        let activityController = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return activityController
        
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType,context: Context) {
        
    }
    
}

