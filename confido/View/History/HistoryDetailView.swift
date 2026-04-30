//
//  HistoryDetailView.swift
//  confido
//
//  Created by Muhammad Alief Rahman Fardillah on 22/04/26.
//

import SwiftUI

struct HistoryDetailView: View {
    @Bindable var history: History
    
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    BackgroundView()
                    
                    Image("")
                        .resizable()
                        .frame(width: 350, height: 300)
                    
                        .background(.white.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .shadow(radius: 20)
                    Image(systemName: history.thumbnail)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                    
                    Image(systemName: "play.circle.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.lightBrown.opacity(0.5))
                        .symbolRenderingMode(.monochrome)
                }
                
//                Divider()
//                    .padding(.horizontal, 16)
//                    .padding(.top, -16)
                
                
                Text("Feedback")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                VStack(alignment: .trailing) {
                    Text(history.date, style: .date)
                        .font(.caption2)
                        .frame(maxWidth: 350, alignment:.trailing)
                        .foregroundStyle(Color(.secondaryLabel))
                }
                
                Text(history.feedback)
                    .font(.caption)
                    .multilineTextAlignment(.center)
                    .frame(width: 350)
                    .padding(.top, 8)
                    
                

                
                Spacer()
                
                
            }
            
            
            .navigationTitle("Feedback")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Topic") {
                        showAlert = true
                        
                        
                    }
                    .alert(isPresented: $showAlert, content: {
                        Alert(title: Text(history.topic),
                              message: Text(history.detailedTopic ?? "No Detailed Topic"),
                              dismissButton: .default(Text("Close")))
                    })
                    .frame(width: 100)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }
            
        }
        
    }
    
}

#Preview {
    HistoryDetailView(history: SampleData.shared.history)
}
