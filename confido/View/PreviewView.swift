//
//  PreviewView.swift
//  confido
//
//  Created by Muhammad Alief Rahman Fardillah on 22/04/26.
//

import SwiftUI
import SwiftData

struct PreviewView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var isMuted: Bool = false
    @State private var isCameraOn: Bool = false
    
    @State private var currentIndex: Int = 0
    
    @State private var createdHistory: History?
    
    let meetingData: [[String: String]] = [
        [
            "topic": "Graphic Design",
            "detailedTopic": "You are presenting your design concept to a client in a meeting, explaining your visual decisions.",
        ],
        [
            "topic": "Coding",
            "detailedTopic": "You are explaining your implementation during a team meeting and discussing technical decisions.",
        ],
        [
            "topic": "Data Science",
            "detailedTopic": "You are presenting insights from your analysis to stakeholders and answering their questions.",
        ]
    ]
        
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Image((isCameraOn) ? "user" : "")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .background(.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .padding(16)
                    .shadow(radius: 20)
                
                HStack {
                    Button("Camera Button", systemImage: (isCameraOn) ? "video.fill" : "video.slash.fill") {
                        isCameraOn = !isCameraOn
                    }
                    .foregroundStyle(.white)
                    .padding(16)
                    .background((isCameraOn) ? .blue : .red)
                    .clipShape(Circle())
                    .labelStyle(.iconOnly)
                    
                    Button("Mic Button", systemImage: (isMuted) ? "microphone.fill" : "microphone.slash.fill") {
                        isMuted = !isMuted
                        
                    }
                        .foregroundStyle(.white)
                        .padding(16)
                        .background((isMuted) ? .blue: .red)
                        .clipShape(Circle())
                        .labelStyle(.iconOnly)
                }
                
                TextField("Enter your name", text: $name)
                    .padding()
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.horizontal, 32)
                    .padding(.bottom, 32)
                
                HStack {
                    Button("Back Arrow", systemImage: "arrowshape.backward.fill") {
                        if currentIndex > 0 {
                            currentIndex -= 1
                        }
                    }
                    .disabled(currentIndex == 0)
                    .foregroundStyle((currentIndex == 0) ? .gray : .black)
                    .padding(16)
                    .background(.white)
                    .clipShape(Circle())
                    .labelStyle(.iconOnly)
                    .shadow(radius: 4)
                    
                    
                    VStack {
                        Text(meetingData[currentIndex]["topic"] ?? "")
                            .font(.headline)
                            .multilineTextAlignment(.center)
                        Text(meetingData[currentIndex]["detailedTopic"] ?? "")
                            .font(.headline)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                    }
                    .padding(32)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(radius: 5)
                    
                    
                    Button("Forward Arrow", systemImage: "arrowshape.forward.fill") {
                        if currentIndex < meetingData.count - 1 {
                            currentIndex += 1
                        }
                    }
                    .disabled(currentIndex == 2)
                    .foregroundStyle((currentIndex == 2) ? .gray : .black)
                    .padding(16)
                    .background(.white)
                    .clipShape(Circle())
                    .labelStyle(.iconOnly)
                    .shadow(radius: 4)
                }
                .padding(.top, 16)
                .padding(.horizontal, 16)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                BackgroundView()
            }
            .navigationTitle("Meeting")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .padding(.horizontal, 12)
                    .background(.red)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    NavigationLink {
                        VideoCallView(name: name, topic: meetingData[currentIndex]["topic"] ?? "", detailedTopic: meetingData[currentIndex]["detailedTopic"] ?? "", isCameraOn: $isCameraOn, isMuted: $isMuted)
                        
                    } label: {
                        Text("Join")
                            .padding(.horizontal, 32)
                            .padding(.vertical, 8)
                            .background(name.isEmpty ? .gray : .blue)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                
                    .disabled(name.isEmpty)
                    .padding(.horizontal, -6)
                }
                
                
//                ToolbarItem(placement: .confirmationAction) {
//                    Button("Join") {
//                        NavigationLink {
//                            
//                            VideoCallView(
//                                name: name,
//                                topic: meetingData[currentIndex]["topic"] ?? "",
//                                detailedTopic: meetingData[currentIndex]["topic"] ?? "",
//                                isCameraOn: $isCameraOn,
//                                isMuted: $isMuted
//                            )
//                        }
//                    }
//                    .padding(.horizontal, 16)
//                    .background(name.isEmpty ? .gray : .blue)
//                    .foregroundStyle(.white)
//                    .clipShape(RoundedRectangle(cornerRadius: 20))
//                    .disabled(name.isEmpty)
//                }
            }
        }
    }
}

#Preview {
    PreviewView()
}
