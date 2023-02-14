//
//  tipeuApp.swift
//
//  typeu
//  Created by Saliou Sow on 13/03/2023.
//  Copyright © 2023 with Swift. All rights reserved.
//
import SwiftUI

@main
struct tipeuApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}

