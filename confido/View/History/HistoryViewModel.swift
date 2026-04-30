//
//  HistoryViewModel.swift
//  confido
//
//  Created by Muhammad Alief Rahman Fardillah on 28/04/26.
//

import Foundation
import SwiftData

@Observable
class HistoryViewModel {
    
    
    func insertSampleData(context: ModelContext) {
        for item in History.sampleData {
            context.insert(item)
        }
    }
    
    func deleteList(context: ModelContext, index: IndexSet, histories: [History]) {
        for i in index {
            context.delete(histories[i])
        }
    }
}
