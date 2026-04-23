//
//  History.swift
//  confido
//
//  Created by Muhammad Alief Rahman Fardillah on 22/04/26.
//

import Foundation
import SwiftData

@Model
class History: Identifiable {
    var topic: String
    var date: Date
    var thumbnail: String
    var detailedTopic: String? = nil
    var feedback: String
    
    
    init(topic: String, date: Date, thumbnail: String, detailedTopic: String? = nil, feedback: String) {
        self.topic = topic
        self.date = date
        self.thumbnail = thumbnail
        self.detailedTopic = detailedTopic
        self.feedback = feedback
    }
    
    static let sampleData = [
        History(
            topic: "Graphic Design",
            date: .now,
            thumbnail: "paintbrush.fill",
            detailedTopic: "You are a graphic designer presenting your design concept to a client in a meeting. You are explaining your visual choices and trying to justify your design decisions clearly.",
            feedback: "You explained your ideas clearly, but you spoke a bit too quickly at times. Try to slow down and emphasize key points. Also, consider pausing after important statements to let your message land."
        ),

        History(
            topic: "Coding",
            date: .now,
            thumbnail: "laptopcomputer",
            detailedTopic: "You are a developer in a team meeting explaining your recent implementation and discussing technical decisions with your teammates.",
            feedback: "Good structure in your explanation, but you relied heavily on filler words like 'um' and 'like'. Try to be more concise and confident when describing technical details."
        ),

        History(
            topic: "Data Science",
            date: .now,
            thumbnail: "chart.bar.fill",
            detailedTopic: "You are presenting data insights to stakeholders in a meeting, explaining trends and answering follow-up questions.",
            feedback: "You communicated your points well, but your tone was a bit monotonous. Vary your tone and add emphasis to keep your audience engaged. Also, make more eye contact when speaking."
        )
    ]
}
