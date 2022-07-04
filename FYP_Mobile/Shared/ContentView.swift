//
//  ContentView.swift
//  Shared
//
//  Created by Randimal Geeganage on 2022-06-29.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    
    var body: some View {
        TabView {
            FarmerView()
                .tabItem {
                    Label("Pizza List", systemImage: "list.dash")
                }
            QRScanner()
                .tabItem {
                    Label("Favourites", systemImage: "star.fill")
                }
            DetailView()
                .tabItem {
                    Label("Favourites", systemImage: "star.fill")
                }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
