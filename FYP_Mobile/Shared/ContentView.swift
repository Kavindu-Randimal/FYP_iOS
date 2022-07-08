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
        Text("hello")
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
