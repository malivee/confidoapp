//
//  GameView.swift
//  confido
//
//  Created by Muhammad Alief Rahman Fardillah on 22/04/26.
//

import SwiftUI

struct GameView: View {
    
    @State private var goToPreviewView: Bool = false
    @State private var viewModel = GameViewModel()
    
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

                    
                    //joystick
                    ZStack {
                        Circle()
                            .fill(.gray.opacity(0.5))
                            .frame(width: 100)
                        
                        Circle()
                            .fill(.gray)
                            .frame(width: 50)
                            .offset(viewModel.joystickOffset)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        // d = /x^2 + y^2
                                        viewModel.handleDragGesture(value: value)
                                        
                                    }
                                    .onEnded { _ in
                                        withAnimation(.spring().speed(3.5)) {
                                            viewModel.endDragGesture()
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
                            .offset(viewModel.leftChairPosition)
                        Image("tungGo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 90)
                            .offset(x: 100, y: -130)
                        //                            .padding(.top, -190)
                        //                            .padding(.leading, 200)
                        //                        Image("desk")
                        //                            .resizable()
                        //                            .scaledToFit()
                        //                            .frame(width: 100)
                        //                            .offset(x: 55, y: -80)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    //avatar
                    ZStack {
                        Image("tung")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35)
                            .offset(
                                viewModel.avatarOffset
                            )
                    }
                    
                }
                
                
                
            }
            .navigationDestination(isPresented: $goToPreviewView) {
                PreviewView()
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
            .alert(isPresented: $viewModel.isShowingalert) {
                Alert(title: Text("Do you want to join this table?"),
                      primaryButton: .default(Text("Continue")) {
                    goToPreviewView = true
                    
                }
                      ,
                      
                      secondaryButton: .cancel()
                      
                )
            }
        }
    }
    
//    func checkAvatarOnChair(action: () -> Void) {
//        // d = / (x2 - x1)^2 + (y2 - y1)^2
//        let x = avatarOffset.width - leftChairPosition.width
//        let y = avatarOffset.height - leftChairPosition.height
//        
//        let distance = sqrt(x * x + y * y)
//        if distance < 40 {
//            action()
//        }
//    }
}

#Preview {
    GameView()
}
