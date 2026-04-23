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
            
            .onDelete(perform: deleteList(index:))
     
            
        }
        
        .task {
            for i in History.sampleData {
                context.insert(i)
                print(i.topic)
                
            
            }
        }
 
    }
    
    func deleteList(index: IndexSet) {
        for i in index {
            context.delete(histories[i])
        }
    }
}
    
    #Preview {
        HistoryList()
            .modelContainer(SampleData.shared.modelContainer)
    }
    
