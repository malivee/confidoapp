//
//  GameView.swift
//  confido
//
//  Created by Muhammad Alief Rahman Fardillah on 22/04/26.
//

import SwiftUI

struct GameView: View {
    
    @State private var joystickOffset: CGSize = .zero
    @State private var avatarOffset: CGSize = .zero
    let movementMultiplier: CGFloat = 2.0
    
    let leftChairPosition = CGSize(width: 0, height: -100)
    
    @State private var goToPreviewView: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Color.veryLightBrown
                        .ignoresSafeArea()
                    Image("backgroundGame")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.top, -100)
                    
                    NavigationLink(destination: PreviewView(), isActive: $goToPreviewView) {
                        EmptyView()
                    }
                    
                    //joystick
                    ZStack {
                        Circle()
                            .fill(.gray.opacity(0.5))
                            .frame(width: 100)
                        
                        Circle()
                            .fill(.gray)
                            .frame(width: 50)
                            .offset(joystickOffset)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        // d = /x^2 + y^2
                                        let x = value.translation.width
                                        let y = value.translation.height
                                        let distance = sqrt(x * x + y * y)
                                        if distance <= 50 {
                                            joystickOffset = CGSize(width: x, height: y)
                                            avatarOffset = CGSize(width: x * movementMultiplier, height: y * movementMultiplier)
                                        }
                                        checkAvatarOnChair {
                                           goToPreviewView = true
                                        }
                                
                                    }
                                    .onEnded { _ in
                                        withAnimation(.spring().speed(3.5)) {
                                            joystickOffset = .zero
                                        }
                                    }
                            )
                    }
                    .frame(maxHeight:.infinity, alignment: .bottom)
                    
                    //expertAndChair
                    ZStack {
                        Image("rightChair")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                            .offset(x: 100, y: -100)
//                            .padding(.top, -140)
//                            .padding(.leading, 210)
                        Image("leftChair")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                            .offset(leftChairPosition)
                        Image("tungGo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 90)
                            .offset(x: 100, y: -130)
//                            .padding(.top, -190)
//                            .padding(.leading, 200)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    //avatar
                    ZStack {
                        Image("tung")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35)
                            .offset(
                                CGSize(
                                    width: avatarOffset.width * movementMultiplier,
                                    height: avatarOffset.height * movementMultiplier
                                )
                            )
                    }

                }
                
                
                
            }
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("User 1")
                            .foregroundStyle(.red)
                            .font(.title3)
                            .fontWeight(.bold)
                            .frame(width: 140, height: 35)
                            .background(.white.opacity(0.5))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .shadow(radius: 12)

                        Text("Expert 1")
                            .foregroundStyle(.blue)
                            .font(.title3)
                            .fontWeight(.bold)
                            .frame(width: 140, height: 35)
                            .background(.white.opacity(0.5))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .shadow(radius: 12)
                        
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing, content: {
                    NavigationLink {
                        HistoryListView()
                    } label: {
                        Image(systemName: "clock.fill")
                    }
                })
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button("Account", systemImage: "person.crop.circle.fill") {
                        
                    }
                })
            }
        }
    }
    
    func checkAvatarOnChair(action: () -> Void) {
        // d = / (x2 - x1)^2 + (y2 - y1)^2
        let x = avatarOffset.width - leftChairPosition.width
        let y = avatarOffset.height - leftChairPosition.height
        
        let distance = sqrt(x * x + y * y)
        if distance < 40 {
            action()
        }
    }
}

#Preview {
    GameView()
}
