//
//  ProgressViewWhileDismissingApp.swift
//  ProgressViewWhileDismissing
//
//  Created by Klaus Menning on 12.02.23.
//

import SwiftUI

@main
struct ProgressViewWhileDismissingApp: App {
    @StateObject var myStates = MyStates()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(myStates)
        }
    }
}
