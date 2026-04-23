//
//  confidoApp.swift
//  confido
//
//  Created by Muhammad Alief Rahman Fardillah on 20/04/26.
//

import SwiftUI
import SwiftData

@main
struct confidoApp: App {
    var body: some Scene {
        WindowGroup {
            GameView()
                .modelContainer(for: [History.self])
        }
    }
}
