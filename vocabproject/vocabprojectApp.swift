//
//  vocabprojectApp.swift
//  vocabproject
//
//  Created by Developer on 07/06/2022.
//

import SwiftUI

@main
struct vocabprojectApp: App {
    
    let persistanceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            SettingView()
                .environment(\.managedObjectContext, persistanceController.container.viewContext)
//            TabView{
//                ContentView()
//                    .tabItem{
//                        Label("Vocab", systemImage: "sun.min.fill")
//                    }
//                SettingView()
//                    .tabItem{
//                        Label("Setting", systemImage: "gear")
//                    }
//            }
        }
    }
}
