//
//  PreviewViewModel.swift
//  confido
//
//  Created by Muhammad Alief Rahman Fardillah on 11/05/26.
//

import Foundation
import SwiftData

@Observable
class PreviewViewModel {
    var name: String = ""
    var isMuted: Bool = false
    var isCameraOn: Bool = false
    var meetingData : [MeetingData] = [
        MeetingData(title: "Graphic Design", detailedTopic: "You are presenting your design concept to a client in a meeting, explaining your visual decisions."),
        MeetingData(title: "Coding", detailedTopic: "You are explaining your implementation during a team meeting and discussing technical decisions."),
        MeetingData(title: "Data Science", detailedTopic: "You are presenting insights from your analysis to stakeholders and answering their questions.")
    ]
    var currentIndex: Int = 0
    
    func previous() {
        if currentIndex > 0 {
            currentIndex -= 1
        }
    }
    
    func next() {
        if currentIndex < meetingData.count - 1 {
            currentIndex += 1
        }
    }
    
}
