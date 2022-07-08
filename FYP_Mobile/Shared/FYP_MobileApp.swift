//
//  FYP_MobileApp.swift
//  Shared
//
//  Created by Randimal Geeganage on 2022-06-29.
//

import SwiftUI

@main
struct FYP_MobileApp: App {
    
    var network = Network()
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//           FarmerView()
//                .environmentObjectiew((network)
//            HomeView()
//                .environmentObject(network)
            
//            DropdownSelector()
//            DetailView()
            SignUp( isPresenting: false)
                .environmentObject(network)
//            
//            Login(isPresenting: false)
//                .environmentObject(network)
        }
    }
}
