//
//  TopicButton.swift
//  confido
//
//  Created by Muhammad Alief Rahman Fardillah on 22/04/26.
//

import SwiftUI

struct TopicButton: ToolbarContent {
    let history: History
    @Binding var showAlert: Bool
    var body: some ToolbarContent {
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

