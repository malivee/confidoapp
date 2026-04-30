//
//  HistoryListView.swift
//  confido
//
//  Created by Muhammad Alief Rahman Fardillah on 22/04/26.
//

import SwiftUI
import SwiftData

struct HistoryListView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HistoryList()
                    .navigationTitle("History")
                    .navigationBarTitleDisplayMode(.inline)
                    .padding(.top, -36)
            }
        }

      
    }
}

#Preview {
    HistoryListView()
        .modelContainer(SampleData.shared.modelContainer)
}
