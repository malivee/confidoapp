//
//  SampleData.swift
//  confido
//
//  Created by Muhammad Alief Rahman Fardillah on 22/04/26.
//

import Foundation
import SwiftData

@MainActor
class SampleData {
    static let shared = SampleData()
    
    let modelContainer: ModelContainer
    
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    var history: History {
        History.sampleData.first!
    }
    
    private init() {
        let schema = Schema([History.self])
        
        let modelConfig = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfig])
            insertSampleData()
            try context.save()
        } catch {
            fatalError("Failed to initialize SampleData: \(error)")
        }
        
        func insertSampleData() {
            for history in History.sampleData {
                context.insert(history)
            }
            
        
        }
    }
}
