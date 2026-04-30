//
//  HistoryList.swift
//  confido
//
//  Created by Muhammad Alief Rahman Fardillah on 20/04/26.
//

import SwiftUI
import SwiftData

struct HistoryList: View {
    
    @Query(sort: \History.date) private var histories: [History]
    @Environment(\.modelContext) private var context
    @State private var viewModel = HistoryViewModel()

    
    var body: some View {
        
        List {
            ForEach(histories) { history in
                NavigationLink() {
                    HistoryDetailView(history: history)
                } label : {
                        HStack {
                            Image(systemName: history.thumbnail)
                                .resizable()
                                .frame(width: 80, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .shadow(radius: 5)
                            
                            VStack(alignment: .leading) {
                                Text(history.topic)
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .lineLimit(1)
                                Text(history.date, style: .date)
                                    .font(.caption)
                                    .fontWeight(.light)
                            
                            }
                            .padding(.leading, 8)
                        
                   
                    }
                }
                
    
            }
            
            .onDelete { indexSet in
                viewModel.deleteList(context: context, index: indexSet, histories: histories)
            }
     
            
        }
        
        .task {
            if histories.isEmpty {
                viewModel.insertSampleData(context: context)
            }

        }
 
    }
}
    
    #Preview {
        HistoryList()
            .modelContainer(SampleData.shared.modelContainer)
    }
    
