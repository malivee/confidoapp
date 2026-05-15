//
//  PreviewViewModel.swift
//  confido
//
//  Created by Muhammad Alief Rahman Fardillah on 11/05/26.
//

import Foundation
import SwiftData

@Observable
class MeetingData: Identifiable {
    var id = UUID()
    var title: String
    var detailedTopic: String
    
//    var name: String = ""
//    var isMuted: Bool = false
//    var isCameraOn: Bool = false
//    
//    var currentIndex: Int = 0
    
    init(title: String, detailedTopic: String) {
        self.title = title
        self.detailedTopic = detailedTopic
//        self.name = name
//        self.isMuted = isMuted
//        self.isCameraOn = isCameraOn
//        self.currentIndex = currentIndex
    }
}
