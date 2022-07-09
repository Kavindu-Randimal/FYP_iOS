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
    var userStatus = UserStatus()
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
//            FarmerView()
//                .environmentObject(network)
            //                            .environmentObjectie(network)
            //            HomeView()
            //                .environmentObject(network)
            
            //            DropdownSelector()
            //            DetailView()
            //            SignUp( isPresenting: false)
            //                .environmentObject(network)
            //
                                    Login(isPresenting: false)
                                        .environmentObject(network)
            //            SignupView(isPresenting: true)
            //                .environmentObject(network)
            
//            CreateView(cultivationName: "")
//                .environmentObject(network)

        }
    }
}
