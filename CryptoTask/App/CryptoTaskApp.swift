//
//  CryptoTaskApp.swift
//  CryptoTask
//
//  Created by Lakshay Gupta on 06/08/25.
//

import SwiftUI
import NavKit
@main
struct CryptoTaskApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationContainerView {
                MainView()
            }
        }
    }
}
