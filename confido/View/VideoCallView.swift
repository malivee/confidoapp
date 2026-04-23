//
//  VideoCallView.swift
//  confido
//
//  Created by Muhammad Alief Rahman Fardillah on 22/04/26.
//

import SwiftUI

struct VideoCallView: View {
        
    let name : String
    let topic: String
    let detailedTopic: String
    
    @Binding var isCameraOn: Bool
    @Binding var isMuted: Bool
    
    @State private var showAlert: Bool = false
    
    @State private var returnHome: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image("expert")
                        .resizable()
                    
                    Text("Expert")
                        .font(.body)
                        .frame(width: 100, height: 50)
                        .background(.blue.opacity(0.8))
                        .border(.white.opacity(0.5))
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(radius: 16)
                        .padding(.bottom, 32)
                        .padding(.trailing, 8)
                    
                }
                
                NavigationLink(destination: GameView(), isActive: $returnHome) {
                    EmptyView()
                }
                
                ZStack(alignment: .bottomTrailing) {
                    Image((isCameraOn) ? "user" : "")
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .background(.gray)
                        .padding(.top, -32)
                    Text(name)
                        .font(.body)
                        .frame(width: 100, height: 50)
                        .background(.blue.opacity(0.8))
                        .border(.white.opacity(0.5))
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(radius: 16)
                        .padding(.bottom, 32)
                        .padding(.trailing, 8)
                }
                
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
                    
                    Button("Leave Button", systemImage: "x.circle.fill") {
                        returnHome = true
                    }
                    .foregroundStyle(.white)
                    .padding(16)
                    .background(.red)
                    .clipShape(Circle())
                    .labelStyle(.iconOnly)
                    
                    
                    
            
                }
                
                
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image(systemName: "record.circle.fill")
                            .symbolEffect(.breathe)
                            .symbolRenderingMode(.multicolor)
                            .foregroundStyle(.red, .gray)
                            .font(.title)
                        Text("Record")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                    }
                    .padding(.leading, 16)
                }
                
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Topic") {
                        showAlert = true
                        
                    }
                    .alert(isPresented: $showAlert, content: {
                        Alert(title: Text(topic),
                              message: Text(detailedTopic),
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
    VideoCallView(name: "Pra", topic: "Graphic Design", detailedTopic: "You are presenting your design concept to a client in a meeting, explaining your visual decisions.", isCameraOn: .constant(false), isMuted: .constant(true))
}
