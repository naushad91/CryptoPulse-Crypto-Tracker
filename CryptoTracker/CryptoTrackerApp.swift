//
//  CryptoTrackerApp.swift
//  CryptoTracker
//
//  Created by Naushad Ali Khan on 01/12/25.
//

import SwiftUI

//@main
//struct MyApp: App {
//    var body: some Scene {
//        WindowGroup {
//            NavigationView {    // modern replacement for NavigationView
//                HomeView()
//                    .navigationBarHidden(true) // hide the navigation bar on this screen
//            }
//        }
//    }
//}

import SwiftUI

@main
struct MyApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
            }
            .environmentObject(vm)   // 🔥 Inject ViewModel here
        }
    }
}
